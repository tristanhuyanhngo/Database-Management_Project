CREATE PROC SP_HopDongHetHang_fix
AS
SET TRAN ISOLATION LEVEL Repeatable read
BEGIN TRAN
	BEGIN TRY
	    SELECT * FROM HopDong 
		WHERE ThoiGianHieuLuc < GETDATE() and TinhTrang = N'Đã duyệt'

		WAITFOR DELAY '00:00:05'

		SELECT COUNT(*) as SoLuongHopDongHetHan
		FROM HopDong
		WHERE ThoiGianHieuLuc < GETDATE() and TinhTrang = N'Đã duyệt'
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN
	END CATCH
COMMIT TRAN
--drop proc SP_HopDongHetHang_fix
--drop proc SP_GiaHanHopDong_fix
go

CREATE PROC SP_GiaHanHopDong_fix
	@MaHopDong int,  @new date
AS
SET TRAN ISOLATION LEVEL Repeatable Read
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
