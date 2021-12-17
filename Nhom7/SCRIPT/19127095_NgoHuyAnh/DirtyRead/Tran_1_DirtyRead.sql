DECLARE @RT INT
--EXEC @RT = SP_DatHang '1','1','5',N'Gia Lai'
EXEC @RT = SP_DatHang '1','1','10',N'Gia Lai'
IF @RT = 1
	PRINT N'Thêm THất bại'
ELSE
	PRINT N'Thêm THÀNH CÔNG'
