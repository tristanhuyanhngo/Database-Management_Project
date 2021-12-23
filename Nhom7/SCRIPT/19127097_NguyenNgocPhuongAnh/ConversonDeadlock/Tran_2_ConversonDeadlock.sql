--Xem và đặt đơn hàng
DECLARE @RT INT
EXEC @RT = SP_XemNhanDonHang '1','3','Hậu Giang'
IF @RT = 1
	PRINT N'NHẬN ĐƠN HÀNG THẤT BẠI'
ELSE
	PRINT N'NHẬN ĐƠN HÀNG THÀNH CÔNG'