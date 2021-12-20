--Gia hạn hợp đồng 
declare @RT int
EXEC @RT = SP_GiaHanHopDong '6','2021-12-30'
--EXEC @RT = SP_GiaHanHopDong_fix '5','2021-12-30'
select* from hopdong

