CREATE PROC SP_ThongBao_HopDong
	@MaHopDong int, @NoiDung nvarchar(50), @MaSoThue int, @ThoiHan date
AS
SET TRAN ISOLATION LEVEL serializable
BEGIN TRAN
	BEGIN TRY
	    INSERT INTO ThongBao(NoiDung,MasoThue) VALUES (@NoiDung,@MaSoThue) 
		WAITFOR DELAY '00:00:05'
		IF NOT EXISTs(select * from HopDong where MaHopDong = @MaHopDong) 
			BEGIN
				PRINT N'Hợp đồng ' + CAST(@MaHopDong AS VARCHAR(10)) + N' Không Tồn Tại'
				ROLLBACK TRAN
				RETURN 1
			END
		UPDATE HopDong SET TinhTrang = N'Đã Duyệt', ThoiGianHieuLuc = @ThoiHan WHERE MaHopDong = @MaHopDong
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN

GO

CREATE PROC SP_LapHopDong_DocThongBao	
@MaSoThue int
AS
SET TRAN ISOLATION LEVEL serializable
BEGIN TRAN
	BEGIN TRY
	    INSERT INTO HopDong(MaSoThue) VALUES (@MaSoThue)
		WAITFOR DELAY '00:00:05'
		SELECT NoiDung
		FROM ThongBao
		WHERE MaSoThue = @MaSoThue
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
