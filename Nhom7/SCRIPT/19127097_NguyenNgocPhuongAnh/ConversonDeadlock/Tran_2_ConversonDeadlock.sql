--Xem và đặt đơn hàng
DECLARE @RT INT
EXEC @RT = SP_XemNhanDonHang '2','115','TP.HCM'
IF @RT = 1
	PRINT N'NHẬN ĐƠN HÀNG THẤT BẠI'
ELSE
	PRINT N'NHẬN ĐƠN HÀNG THÀNH CÔNG'