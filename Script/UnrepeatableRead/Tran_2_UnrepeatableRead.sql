--Gia hạn hợp đồng 
declare @RT int
--EXEC @RT = SP_GiaHanHopDong 'HD04','2021-12-30'
EXEC @RT = SP_GiaHanHopDong_fix 'HD01','2021-12-30'
select* from hopdong

