﻿-- xem đơn hàng
select DonHang.* from DonHang,TaiXe where TinhTrang = N'Chờ' and KhuVuc = KhuVucHoatDong and TaiXe.MaTaiXe = '16' and DonHang.MaTaiXe is null
-- đặt đơn hàng
DECLARE @RT INT
--EXEC @RT = SP_NhanDonHang_deadlock '16','20'
EXEC @RT = SP_NhanDonHang_deadlock_fix '16','21'
IF @RT = 1
	PRINT N'THÊM THẤT BẠI'
ELSE
	PRINT N'THÊM THÀNH CÔNG'

--select * from donhang