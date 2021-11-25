CREATE PROC SP_XemNhanDonHang
	@MaTaiXe varchar(10), @MaDonHang varchar(10), @KhuVuc nvarchar(50)
AS
SET TRAN ISOLATION LEVEL SERIALIZABLE
BEGIN TRAN
	BEGIN TRY
		IF NOT EXISTS(select * from TaiXe where MaTaiXe = @MaTaiXe)
			BEGIN
				PRINT N'Tài xế ' + CAST(@MaTaiXe AS VARCHAR(10)) + N' không tồn tại'
				ROLLBACK TRAN
				RETURN 1
			END
		IF NOT EXISTS(select * from DonHang,TaiXe where DonHang.KhuVuc = Taixe.KhuVucHoatDong and Taixe.MaTaiXe = @MaTaiXe and TinhTrang = N'Chờ' and MaDonHang = @MaDonHang)
			BEGIN
				PRINT N'Đặt hàng không khả thi'
				ROLLBACK TRAN
				RETURN 1
			END
		--Cho tài xế xem những đơn hàng trong khu vực của mình
		SELECT * FROM DonHang WHERE KhuVuc = @KhuVuc
		--Lựa đơn
		WAITFOR DELAY '0:0:010'
		--Chọn 1 đơn để nhận
		update DonHang set TinhTrang = N'Đang giao' where @MaDonHang = MaDonHang 
		update DonHang set MaTaiXe = @MaTaiXe where @MaDonHang = MaDonHang 
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1	
	END CATCH

COMMIT TRAN
RETURN 0
