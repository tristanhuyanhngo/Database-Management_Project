DECLARE @RT INT
--EXEC @RT = SP_LapHopDong_DocThongBao '1'
EXEC @RT = SP_LapHopDong_DocThongBao_fix '1'
IF @RT = 1
	PRINT N'Làm thất bại'
ELSE
	PRINT N'Làm thành công'
