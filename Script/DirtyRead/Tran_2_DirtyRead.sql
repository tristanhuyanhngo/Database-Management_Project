DECLARE @RT INT
--EXEC @RT = SP_XemSoLuongDonHang 'DT01'
EXEC @RT = SP_XemSoLuongDonHang_fix 'DT01'
IF @RT = 1
	PRINT N'Xem THất bại'
ELSE
	PRINT N'Xem THÀNH CÔNG'

select * from DonHang where MaSoThue = 'DT01' 
	and DAY(DonHang.NgayDat) = DAY(getdate())
	and MONTH(DonHang.NgayDat) = MONTH(getdate())
	and YEAR(DonHang.NgayDat) = YEAR(getdate())
