﻿DECLARE @RT INT
--EXEC @RT = SP_ThongBao_HopDong '1',N'Chúng tôi đã duyệt hợp đồng cho bạn','1','14','2022-1-1'
EXEC @RT = SP_ThongBao_HopDong_fix '1',N'Chúng tôi đã duyệt hợp đồng cho bạn','3','163','2022-1-1'
IF @RT = 1
	PRINT N'Làm thất bại'
ELSE
	PRINT N'Làm thành công'

