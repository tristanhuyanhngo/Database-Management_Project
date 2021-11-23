
CREATE PROC SP_HopDongHetHang
AS
SET TRAN ISOLATION LEVEL Read uncommitted
BEGIN TRAN
	BEGIN TRY
	    SELECT * FROM HopDong 
		WHERE ThoiGianHieuLuc < GETDATE()

		WAITFOR DELAY '00:00:05'

		SELECT COUNT(*) as SoLuongHopDongHetHan
		FROM HopDong
		WHERE ThoiGianHieuLuc < GETDATE()
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN
	END CATCH
COMMIT TRAN

go

CREATE PROC SP_GiaHanHopDong
	@MaHopDong varchar(10), @new date
AS
SET TRAN ISOLATION LEVEL Read uncommitted
BEGIN TRAN
	BEGIN TRY
		IF NOT EXISTS(select * from HopDong where MaHopDong = @MaHopDong)
			BEGIN
				PRINT N'HopDong' + CAST(@MaHopDong AS VARCHAR(10)) + N' Không Tồn Tại'
				ROLLBACK TRAN
				RETURN 1
			END
		UPDATE HopDong SET ThoiGianHieuLuc = @new WHERE MaHopDong = @MaHopDong
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1	
	END CATCH
COMMIT TRAN
