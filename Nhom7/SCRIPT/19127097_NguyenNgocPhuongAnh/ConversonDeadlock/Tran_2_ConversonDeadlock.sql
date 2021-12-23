-- xem đơn hàng
select DonHang.* from DonHang,TaiXe where TinhTrang = N'Chờ' and KhuVuc = KhuVucHoatDong and TaiXe.MaTaiXe = '17' and DonHang.MaTaiXe is null

-- đặt đơn hàng
DECLARE @RT INT
EXEC @RT = SP_NhanDonHang_deadlock '17','14'
--EXEC @RT = SP_NhanDonHang_deadlock_fix '17','13'
IF @RT = 1
	PRINT N'THÊM THẤT BẠI'
ELSE
	PRINT N'THÊM THÀNH CÔNG'
