--Gia hạn hợp đồng 
declare @RT int
EXEC @RT = SP_GiaHanHopDong 'HD02','2021-12-12'

select* from hopdong