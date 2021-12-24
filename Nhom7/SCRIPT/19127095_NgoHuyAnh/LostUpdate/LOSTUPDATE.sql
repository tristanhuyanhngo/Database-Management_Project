use HTDCHO
go

CREATE PROC SP_NhanDonHang
	@MaTaiXe int,  @MaDonHang int
AS
--SET TRAN ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
	BEGIN TRY
		IF NOT EXISTs(select * from TaiXe where MaTaiXe = @MaTaiXe)
			BEGIN
				PRINT N'Tài Xế' + CAST(@MaTaiXe AS VARCHAR(10)) + N' Không Tồn Tại'
				ROLLBACK TRAN
				RETURN 1
			END
		IF NOT EXISTS(select * from DonHang,TaiXe where DonHang.KhuVuc = Taixe.KhuVucHoatDong and DonHang.MaTaiXe is null
		and Taixe.MaTaiXe = @MaTaiXe and TinhTrang = N'Chờ' and MaDonHang = @MaDonHang)
			BEGIN
				PRINT N'Đặt hàng không khả thi'
				ROLLBACK TRAN
				RETURN 1
			END

		WAITFOR DELAY '0:0:05'

		update DonHang set TinhTrang = N'Đang Giao' where @MaDonHang = MaDonHang 
		update DonHang set MaTaiXe = @MaTaiXe where @MaDonHang = MaDonHang 
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1	
	END CATCH

COMMIT TRAN
