CREATE PROC SP_LapHopDong_DocThongBao_fix
@MaSoThue int
AS
BEGIN TRAN
	INSERT INTO HopDong with(TabLockX) (MaSoThue)  VALUES (@MaSoThue)

	WAITFOR DELAY '00:00:05'

	SELECT NoiDung
	FROM ThongBao  with(TabLockX)
	WHERE MaSoThue = @MaSoThue
COMMIT TRAN

GO

CREATE PROC SP_ThongBao_HopDong_fix
	@NoiDung nvarchar(50), @MaSoThue int
AS
BEGIN TRAN
	INSERT INTO ThongBao  with(TabLockX) (NoiDung,MasoThue) VALUES (@NoiDung,@MaSoThue) 
	WAITFOR DELAY '00:00:05'
	select * from hopdong  with(TabLockX)
COMMIT TRAN
