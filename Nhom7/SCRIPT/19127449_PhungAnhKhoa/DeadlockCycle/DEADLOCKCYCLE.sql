USE HTDCHO
go

CREATE PROC SP_LapHopDong_DocThongBao	
@MaSoThue int
AS
SET TRAN ISOLATION LEVEL Repeatable Read
BEGIN TRAN
	INSERT INTO HopDong(MaSoThue) VALUES (@MaSoThue)

	WAITFOR DELAY '00:00:05'

	SELECT NoiDung
	FROM ThongBao
	WHERE MaSoThue = @MaSoThue
COMMIT TRAN

GO

CREATE PROC SP_ThongBao_HopDong
	@NoiDung nvarchar(50), @MaSoThue int
AS
SET TRAN ISOLATION LEVEL Repeatable Read
BEGIN TRAN
	INSERT INTO ThongBao(NoiDung,MasoThue) VALUES (@NoiDung,@MaSoThue) 
	WAITFOR DELAY '00:00:05'
	select * from hopdong 
COMMIT TRAN



