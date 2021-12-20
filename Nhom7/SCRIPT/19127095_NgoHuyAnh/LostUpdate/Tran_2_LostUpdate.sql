-- xem đơn hàng
select DonHang.* from DonHang,TaiXe where TinhTrang = N'Chờ' and KhuVuc = KhuVucHoatDong and TaiXe.MaTaiXe = '5'

-- đặt đơn hàng
DECLARE @RT INT
EXEC @RT = SP_NhanDonHang_fix '5','99'
IF @RT = 1
	PRINT N'THÊM THẤT BẠI'
ELSE
	PRINT N'THÊM THÀNH CÔNG'

-- xem lại đơn hàng xem đã đặt thành công hay chưa
select * from DonHang
