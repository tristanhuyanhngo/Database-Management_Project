USE HTDCHO
go

DECLARE @RT INT
--EXEC @RT = SP_ThongBao_HopDong N'Chúng tôi đã duyệt hợp đồng cho bạn','1'
EXEC @RT = SP_ThongBao_HopDong_fix N'Chúng tôi đã duyệt hợp đồng cho bạn','1'
IF @RT = 1
	PRINT N'Làm thất bại'
ELSE
	PRINT N'Làm thành công'
