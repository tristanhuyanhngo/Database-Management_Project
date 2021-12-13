DECLARE @RT INT
--EXEC @RT = SP_DatHang 'DT01','KH01','DH5',N'Gia Lai'
EXEC @RT = SP_DatHang 'DT01','KH01','DH10',N'Gia Lai'
IF @RT = 1
	PRINT N'Thêm THất bại'
ELSE
	PRINT N'Thêm THÀNH CÔNG'
