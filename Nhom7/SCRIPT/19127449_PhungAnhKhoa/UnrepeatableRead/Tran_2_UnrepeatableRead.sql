USE HTDCHO
go

--Gia hạn hợp đồng 
declare @RT int
EXEC @RT = SP_GiaHanHopDong '13','2021-12-30'
--EXEC @RT = SP_GiaHanHopDong_fix '5','2021-12-30'

