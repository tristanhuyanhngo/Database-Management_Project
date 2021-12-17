--Thêm sản phẩm
DECLARE @RT INTEXEC @RT = SP_ThemSanPham '1','1',1,10000,nullIF @RT = 1	PRINT N'THÊM THẤT BẠI'ELSE	PRINT N'THÊM THÀNH CÔNG'