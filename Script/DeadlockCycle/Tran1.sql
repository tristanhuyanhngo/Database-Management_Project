DECLARE @RT INT
EXEC @RT = SP_ThongBao_HopDong 'HD01',N'Chúng tôi đã duyệt hợp đồng cho bạn','DT01','TB14','2022-1-1'
IF @RT = 1
	PRINT N'Làm thất bại'
ELSE
	PRINT N'Làm thành công'

