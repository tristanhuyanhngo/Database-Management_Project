DECLARE @RT INT
--EXEC @RT = SP_LapHopDong_DocThongBao '8','3'
EXEC @RT = SP_LapHopDong_DocThongBao_fix '15','3'
IF @RT = 1
	PRINT N'Làm thất bại'
ELSE
	PRINT N'Làm thành công'

