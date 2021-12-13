-- xem đơn hàng
select DonHang.* from DonHang,TaiXe where TinhTrang = N'Chờ' and KhuVuc = KhuVucHoatDong and TaiXe.MaTaiXe = 'TX01'

-- đặt đơn hàng
DECLARE @RT INT--EXEC @RT = SP_NhanDonHang 'TX01','DH01'EXEC @RT = SP_NhanDonHang_fix 'TX01','DH99'IF @RT = 1	PRINT N'THÊM THẤT BẠI'ELSE	PRINT N'THÊM THÀNH CÔNG'-- xem lại đơn hàng xem đã đặt thành công hay chưaselect * from DonHang