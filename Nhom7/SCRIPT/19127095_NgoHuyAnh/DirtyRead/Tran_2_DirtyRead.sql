﻿DECLARE @RT INT
--EXEC @RT = SP_XemSoLuongDonHang '1'
EXEC @RT = SP_XemSoLuongDonHang_fix '1'
IF @RT = 1
	PRINT N'Xem THất bại'
ELSE
	PRINT N'Xem THÀNH CÔNG'

select * from DonHang where MaSoThue = '1' 
	and DAY(DonHang.NgayDat) = DAY(getdate())
	and MONTH(DonHang.NgayDat) = MONTH(getdate())
	and YEAR(DonHang.NgayDat) = YEAR(getdate())