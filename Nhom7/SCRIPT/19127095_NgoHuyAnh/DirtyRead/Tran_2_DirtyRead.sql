DECLARE @RT INT
--EXEC @RT = SP_XemSoLuongDonHang '1'
EXEC @RT = SP_XemSoLuongDonHang_fix '1'
IF @RT = 1
	PRINT N'Xem THất bại'
ELSE
	PRINT N'Xem THÀNH CÔNG'

