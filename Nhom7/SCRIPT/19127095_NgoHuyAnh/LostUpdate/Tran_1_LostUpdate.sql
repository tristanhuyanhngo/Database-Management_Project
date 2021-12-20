-- xem đơn hàng
select DonHang.* from DonHang,TaiXe where TinhTrang = N'Chờ' and KhuVuc = KhuVucHoatDong and TaiXe.MaTaiXe = '41' and DonHang.MaTaiXe is null

-- đặt đơn hàng
DECLARE @RT INT
EXEC @RT = SP_NhanDonHang '41','706'
--EXEC @RT = SP_NhanDonHang_fix '41','706'
IF @RT = 1
	PRINT N'THÊM THẤT BẠI'
ELSE
	PRINT N'THÊM THÀNH CÔNG'




