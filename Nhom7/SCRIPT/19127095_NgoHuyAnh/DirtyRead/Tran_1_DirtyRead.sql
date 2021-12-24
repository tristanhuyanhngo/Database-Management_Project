USE HTDCHO
go

DECLARE @RT INT
--EXEC @RT = SP_DatHang '11','1',N'Gia Lai'
EXEC @RT = SP_DatHang_fix '11','1',N'Gia Lai'
IF @RT = 1
	PRINT N'Thêm THất bại'
ELSE
	PRINT N'Thêm THÀNH CÔNG'
