DECLARE @RT INT
EXEC @RT = SP_XemSoLuongDonHang 'DT01'
IF @RT = 1
	PRINT N'Xem THất bại'
ELSE
	PRINT N'Xem THÀNH CÔNG'

select * from DonHang where MaSoThue = 'DT01'