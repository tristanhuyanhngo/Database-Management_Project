use HTDCHO
go

--Xem sản phẩm
DECLARE @RT INT
--EXEC @RT = SP_XemSanPham '8'
EXEC @RT = SP_XemSanPham_fix '8'
IF @RT = 1
	PRINT N'XEM THẤT BẠI'
ELSE
	PRINT N'XEM THÀNH CÔNG'

