﻿CREATE PROC SP_ThongBao_HopDong
	@MaHopDong varchar(10), @NoiDung nvarchar(50), @MaSoThue varchar(10), @MaThongBao varchar(10), @ThoiHan date
AS
SET TRAN ISOLATION LEVEL serializable
BEGIN TRAN
	BEGIN TRY
	    INSERT INTO ThongBao(MaThongBao,NoiDung,MasoThue) VALUES (@MaThongBao, @NoiDung, @MaSoThue) 
		WAITFOR DELAY '00:00:05'
		IF NOT EXISTs(select * from HopDong where MaHopDong = @MaHopDong) 
			BEGIN
				PRINT N'Hợp đồng ' + CAST(@MaHopDong AS VARCHAR(10)) + N' Không Tồn Tại'
				ROLLBACK TRAN
				RETURN 1
			END
		UPDATE HopDong SET TinhTrang = N'Đã Duyệt' WHERE MaHopDong = @MaHopDong
		UPDATE HopDong SET ThoiGianHieuLuc = @ThoiHan WHERE MaHopDong = @MaHopDong
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN

GO

CREATE PROC SP_LapHopDong_DocThongBao	
	@MaHopDong varchar(10), @MaSoThue varchar(10)
AS
SET TRAN ISOLATION LEVEL serializable
BEGIN TRAN
	BEGIN TRY
	    INSERT INTO HopDong(MaHopDong, MaSoThue) VALUES (@MaHopDong, @MaSoThue)
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
