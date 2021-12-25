use HTDCHO
go

-- xem đơn hàng
select DonHang.* from DonHang,TaiXe where TinhTrang = N'Chờ' and KhuVuc = KhuVucHoatDong and TaiXe.MaTaiXe = '17' and DonHang.MaTaiXe is null

-- đặt đơn hàng
DECLARE @RT INT
--EXEC @RT = SP_NhanDonHang '17','18'
EXEC @RT = SP_NhanDonHang_fix '17','19'
IF @RT = 1
	PRINT N'THÊM THẤT BẠI'
ELSE
	PRINT N'THÊM THÀNH CÔNG'

