USE HTDCHO
go

DECLARE @RT INT
--EXEC @RT = SP_XemSoLuongDonHang '11'
EXEC @RT = SP_XemSoLuongDonHang_fix '11'
IF @RT = 1
	PRINT N'Xem THất bại'
ELSE
	PRINT N'Xem THÀNH CÔNG'

