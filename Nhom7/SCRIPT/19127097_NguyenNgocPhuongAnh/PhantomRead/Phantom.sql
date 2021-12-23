CREATE PROC SP_ThemSanPham(
	@MaChiNhanh int, 
	@SoLuongTon int,
	@GiaCa int,
	@TenSP varchar(50))
AS
BEGIN TRAN
	BEGIN TRY
		IF NOT EXISTs(select * from ChiNhanh where MaChiNhanh = @MaChiNhanh)
			BEGIN
				PRINT N'Chi nhánh ' + CAST(@MaChiNhanh AS VARCHAR(10)) + N' không tồn tại'
				ROLLBACK TRAN
				RETURN 1
			END
		IF EXISTS(select * from SanPham where @MaSP=MaSP)
		BEGIN
				PRINT N'Sản phẩm đã tồn tại'
				ROLLBACK TRAN
				RETURN 1
			END

		INSERT SanPham VALUES(@MaChiNhanh, @SoLuongTon, @GiaCa, @TenSP)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1	
	END CATCH

COMMIT TRAN
RETURN 0
GO
CREATE PROC SP_XemSanPham
	@MaSoThue int
AS
SET TRAN ISOLATION LEVEL SERIALIZABLE
BEGIN TRAN
	BEGIN TRY
		IF NOT EXISTs(select * from DoiTac where @MaSoThue = MaSoThue)
			BEGIN
				PRINT N'Đối tác ' + CAST(@MaSoThue AS int) + N' không tồn tại'
				ROLLBACK TRAN
				RETURN 1
			END
		SELECT * FROM SanPham WHERE MaChiNhanh IN (SELECT MaChiNhanh FROM ChiNhanh WHERE MaSoThue=@MaSoThue)
		--Khách hàng xem sản phẩm
		WAITFOR DELAY '0:0:05'
		--Xem lại
		SELECT * FROM SanPham WHERE MaChiNhanh IN (SELECT MaChiNhanh FROM ChiNhanh WHERE MaSoThue=@MaSoThue)
		END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1	
	END CATCH

COMMIT TRAN
RETURN 0
