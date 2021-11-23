DECLARE @RT INT
EXEC @RT = SP_LapHopDong_DocThongBao 'HD08','DT03'
IF @RT = 1
	PRINT N'Làm thất bại'
ELSE
	PRINT N'Làm thành công'