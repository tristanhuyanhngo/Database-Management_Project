USE HTDCHO
go

CREATE PROC SP_HopDongHetHang
AS
SET TRAN ISOLATION LEVEL Read committed
BEGIN TRAN
	    SELECT * FROM HopDong 
		WHERE ThoiGianHieuLuc < GETDATE() and TinhTrang = N'Đã duyệt'

		WAITFOR DELAY '00:00:05'

		SELECT COUNT(*) as SoLuongHopDongHetHan
		FROM HopDong
		WHERE ThoiGianHieuLuc < GETDATE() and TinhTrang = N'Đã duyệt'
COMMIT TRAN
--drop proc SP_HopDongHetHang
--drop proc SP_GiaHanHopDong
go

CREATE PROC SP_GiaHanHopDong
	@MaHopDong int,  @new date
AS
SET TRAN ISOLATION LEVEL Read committed
BEGIN TRAN
		IF NOT EXISTS(select * from HopDong where MaHopDong = @MaHopDong)
			BEGIN
				PRINT N'HopDong' + CAST(@MaHopDong AS VARCHAR(10)) + N' Không Tồn Tại'
				ROLLBACK TRAN
				RETURN 1
			END
		UPDATE HopDong SET ThoiGianHieuLuc = @new WHERE MaHopDong = @MaHopDong
COMMIT TRAN