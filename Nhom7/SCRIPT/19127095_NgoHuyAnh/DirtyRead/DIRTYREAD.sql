USE HTDCHO
go

CREATE PROC SP_DatHang
	@MaSoThue int,  @MaKhachHang int, @KhuVuc nvarchar(50)
AS
BEGIN TRAN
	IF NOT EXISTS(select * from DoiTac where MaSoThue = @MaSoThue)
		BEGIN
			PRINT N'Đối tác' + CAST(@MaSoThue AS int) + N' Không Tồn Tại'
			ROLLBACK TRAN
			RETURN 1
		END

	INSERT INTO DonHang(MaSoThue,MaKhachHang,TinhTrang,KhuVuc,NgayDat) 
	values (@MaSoThue, @MaKhachHang,N'Chờ', @KhuVuc,getdate())

	WAITFOR DELAY '0:0:05'

	 DECLARE @soDH INT

	SELECT @soDH = COUNT(MaDonHang) 
	FROM DonHang 
	where MaSoThue = @MaSoThue 
	and DAY(DonHang.NgayDat) = DAY(getdate())
	and MONTH(DonHang.NgayDat) = MONTH(getdate())
	and YEAR(DonHang.NgayDat) = YEAR(getdate())

	IF @soDH > (SELECT SoLuongDonHangMoiNgay FROM DoiTac WHERE @MaSoThue = MaSoThue)
	BEGIN
		PRINT N'Không thể đặt thêm đơn hàng vì đã vượt quá số lượng đơn của đối tác'
		ROLLBACK TRAN
		return 1
	END
COMMIT TRAN


go 

CREATE PROC SP_XemSoLuongDonHang
	@MaSoThue varchar(10)
AS
SET TRAN ISOLATION LEVEL Read uncommitted
BEGIN TRAN
	BEGIN TRY
		IF NOT EXISTS(select * from DoiTac where MaSoThue = @MaSoThue)
			BEGIN
				PRINT N'Đối tác' + CAST(@MaSoThue AS VARCHAR(10)) + N' Không Tồn Tại'
				ROLLBACK TRAN
				RETURN 1
			END
		select * from DonHang where MaSoThue = @MaSoThue 
		and DAY(DonHang.NgayDat) = DAY(getdate())
		and MONTH(DonHang.NgayDat) = MONTH(getdate())
		and YEAR(DonHang.NgayDat) = YEAR(getdate())
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1	
	END CATCH

COMMIT TRAN
