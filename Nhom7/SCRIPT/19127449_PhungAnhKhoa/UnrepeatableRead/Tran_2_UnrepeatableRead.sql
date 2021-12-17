--Gia hạn hợp đồng 
declare @RT int
--EXEC @RT = SP_GiaHanHopDong '4','2021-12-30'
EXEC @RT = SP_GiaHanHopDong_fix '1','2021-12-30'
select* from hopdong

