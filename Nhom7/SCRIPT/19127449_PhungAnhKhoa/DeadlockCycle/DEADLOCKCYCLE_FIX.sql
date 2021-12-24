USE HTDCHO
go

CREATE PROC SP_LapHopDong_DocThongBao_fix
@MaSoThue int
AS
SET TRAN ISOLATION LEVEL Read Uncommitted
BEGIN TRAN
	INSERT INTO HopDong (MaSoThue)  VALUES (@MaSoThue)

	WAITFOR DELAY '00:00:05'

	SELECT NoiDung
	FROM ThongBao  with(TabLockX)
	WHERE MaSoThue = @MaSoThue
COMMIT TRAN

GO

CREATE PROC SP_ThongBao_HopDong_fix
	@NoiDung nvarchar(50), @MaSoThue int
AS
SET TRAN ISOLATION LEVEL Read Uncommitted
BEGIN TRAN
	INSERT INTO ThongBao (NoiDung,MasoThue) VALUES (@NoiDung,@MaSoThue) 
	WAITFOR DELAY '00:00:05'
	select * from hopdong  
COMMIT TRAN
