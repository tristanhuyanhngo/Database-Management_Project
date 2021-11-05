CREATE DATABASE HTDCHO
GO 
USE HTDCHO
GO
--------------------------------------Create table ---------------------------------------
create TABLE DoiTac
(
	MaSoThue VARCHAR(10) PRIMARY KEY,
	TenDoitac NVARCHAR(50),
	NguoiDaiDien NVARCHAR(50),
	ThanhPho NVARCHAR(50),
	Quan NVARCHAR(50),
	SoChiNhanh INT,
	SoLuongDonHangMoiNgay INT,
	LoaiHangVanChuyen NVARCHAR(50),
	DiaChiKinhDoanh NVARCHAR(50),
	SDT VARCHAR(50),
	Email VARCHAR(50)
)

create TABLE HopDong
(
	MaHopDong VARCHAR(10) PRIMARY KEY,
	MaSoThue VARCHAR(10) NOT NULL,
	SoChiNhanhDangKy INT,
	PhanTramHoaHong FLOAT,
	ThoiGianHieuLuc DATE,
	TinhTrang NVARCHAR(50),
	CHECK (TinhTrang IN (N'Đã duyệt', N'Chờ duyệt'))
)

create TABLE DonHang
(
	MaDonHang VARCHAR(10) PRIMARY KEY,
	TenDonHang NVARCHAR(50),
	NgayDat DATE,
	TinhTrang NVARCHAR(50),
	KhuVuc NVARCHAR(50),
	PhiVanChuyen INT,
	PhiSanPham INT,
	HinhThucThanhToan NVARCHAR(50),
	DiaChiGiaoHang NVARCHAR(50),
	MaKhachHang VARCHAR(10) NOT NULL,
	MaSoThue VARCHAR(10) NOT NULL,
	MaTaiXe VARCHAR(10),
	CHECK (TinhTrang IN (N'Đã giao', N'Đang giao',N'Chờ'))
)

create TABLE KhachHang
(
	MaKhachHang VARCHAR(10) PRIMARY KEY,
	HoTen NVARCHAR(50),
	SDT VARCHAR(50),
	DiaChi NVARCHAR(50),
	Email VARCHAR(50)
)

CREATE TABLE TaiXe
(
	MaTaiXe VARCHAR(10) PRIMARY KEY,
	HoTen NVARCHAR(50),
	CMND VARCHAR(50) UNIQUE,
	DienThoai VARCHAR(50),
	BienSoXe VARCHAR(50),
	DiaChi NVARCHAR(50),
	KhuVucHoatDong NVARCHAR(50),
	Email NVARCHAR(50),
	STK NVARCHAR(50),
	NganHang NVARCHAR(50)
)

CREATE TABLE ChiNhanh
(
	MaChiNhanh VARCHAR(10) PRIMARY KEY,
	MaSoThue VARCHAR(10) NOT NULL,
	TenChiNhanh NVARCHAR(50),
	DiaChi NVARCHAR(50)
)

CREATE TABLE ThongBao
(
	MaThongBao VARCHAR(10) PRIMARY KEY,
	NoiDung NVARCHAR(50),
	MaSoThue VARCHAR(10) NOT NULL
)

CREATE TABLE NhanVien
(
	MaNhanVien VARCHAR(10) PRIMARY KEY,
	HoTen NVARCHAR(50),
	SDT VARCHAR(10),
	DiaChi NVARCHAR(50),
	Email VARCHAR(50)
)

CREATE TABLE Admins
(
	MaAdmin VARCHAR(10) PRIMARY KEY,
	HoTen NVARCHAR(50),
	SDT VARCHAR(10),
	DiaChi NVARCHAR(50),
	Email VARCHAR(50)
)


CREATE TABLE SanPham
(
	MaSP VARCHAR(10) PRIMARY KEY,
	MaChiNhanh VARCHAR(10) NOT NULL,
	SoLuongTon INT,
	GiaCa INT,
	TenSP VARCHAR(50)
)

CREATE TABLE DHSP
(
	MaSP VARCHAR(10) PRIMARY KEY,
	MaDonHang VARCHAR(10) NOT NULL,
	SoLuong INT,
	Gia INT,
)
CREATE TABLE TaiKhoan
(
	MaNguoidung VARCHAR(10) PRIMARY KEY,
	TenDangNhap VARCHAR(50) UNIQUE,
	MatKhau VARCHAR(50),
	LoaiNguoiDung int,
	TinhTrang NVARCHAR(50),
	CHECK (TinhTrang IN(N'Khoá', N'Mở')),
	CHECK (LoaiNguoiDung IN(1,2,3,4,5))
)
--------------------------------------Foreign key-----------------------------------------
GO 
ALTER TABLE dbo.DonHang
ADD CONSTRAINT FK_DH_KH
FOREIGN KEY (MaKhachHang)
REFERENCES dbo.KhachHang(MaKhachHang)

ALTER TABLE dbo.DonHang
ADD CONSTRAINT FK_DH_DT
FOREIGN KEY (MaSoThue)
REFERENCES dbo.DoiTac(MaSoThue)

ALTER TABLE dbo.DonHang
ADD CONSTRAINT FK_DH_TX
FOREIGN KEY (MaTaiXe)
REFERENCES dbo.TaiXe(MaTaiXe)

ALTER TABLE dbo.HopDong
ADD CONSTRAINT FK_HD_DT
FOREIGN KEY (MaSoThue)
REFERENCES dbo.DoiTac(MaSoThue)

ALTER TABLE dbo.ThongBao
ADD CONSTRAINT FK_TB_DT
FOREIGN KEY (MaSoThue)
REFERENCES dbo.DoiTac(MaSoThue)

ALTER TABLE dbo.SanPham
ADD CONSTRAINT FK_SP_CN
FOREIGN KEY (MaChiNhanh)
REFERENCES dbo.ChiNhanh(MaChiNhanh)

ALTER TABLE dbo.DHSP
ADD CONSTRAINT FK_DHSP_DH
FOREIGN KEY (MaDonHang)
REFERENCES dbo.DonHang(MaDonHang)

ALTER TABLE dbo.DHSP
ADD CONSTRAINT FK_DHSP_SP
FOREIGN KEY (MaSP)
REFERENCES dbo.SanPham(MaSP)
----------------------------------------Trigger-------------------------------------------
-- Thêm, chỉnh chi nhánh. mỗi đối tác có ghi số lượng chi nhánh khi đăng ký
GO 
CREATE TRIGGER tg_ChiNhanhTong
ON dbo.ChiNhanh FOR INSERT,UPDATE
as
BEGIN
    DECLARE @sochinhanh INT

	SELECT @sochinhanh = COUNT(dbo.ChiNhanh.MaChiNhanh) FROM dbo.ChiNhanh,Inserted 
	WHERE Inserted.MaSoThue = dbo.ChiNhanh.MaSoThue GROUP BY dbo.ChiNhanh.MaSoThue

	IF @sochinhanh > (SELECT SoChiNhanh FROM dbo.DoiTac,Inserted WHERE Inserted.MaSoThue = dbo.DoiTac.MaSoThue)
	BEGIN
		PRINT N'Đã đủ số chi nhánh, không thể thêm'
		ROLLBACK TRAN
		return
	END
END

-- Mỗi sản phẩm có 1 số lượng nhất định, nếu thêm sửa số lượng mà vượt quá số hiện tại thì huỷ
GO 
CREATE TRIGGER tg_LuongDatHang
ON dbo.DHSP FOR INSERT,UPDATE
as
BEGIN
    DECLARE @sosanpham INT

	SELECT @sosanpham = SUM(DHSP.SoLuong) FROM dbo.DHSP, Inserted WHERE Inserted.MaSP = DHSP.MaSP

	IF @sosanpham>(SELECT SoLuongTon FROM dbo.SanPham,Inserted WHERE dbo.SanPham.masp = Inserted.masp)
	BEGIN
	    PRINT N'Không thể đặt thêm'
		ROLLBACK TRAN
		return
	END
END

-- Mỗi đối tác có số lượng đơn giao nhất định cho mỗi ngày nếu đã đủ thì không giao thêm đơn nào nữa
GO 
CREATE TRIGGER tg_DonHangHangNgay
ON dbo.DonHang FOR INSERT
as
BEGIN
    DECLARE @soDH INT

	SELECT @soDH = COUNT(dbo.DonHang.MaDonHang) FROM dbo.DonHang,Inserted 
	WHERE Inserted.MaSoThue = dbo.DonHang.MaSoThue AND dbo.DonHang.ngaydat = GETDATE()

	IF @soDH > (SELECT SoLuongDonHangMoiNgay FROM dbo.DoiTac, Inserted WHERE Inserted.MaSoThue = dbo.DoiTac.MaSoThue)
	BEGIN
	    PRINT N'Không thể đặt thêm đơn hàng vì đã vượt quá số lượng đơn của đối tác'
		ROLLBACK TRAN
		return
	END
END

--------------------------------------Transaction----------------------------------------
GO
CREATE PROC TaiDangKyHoaDon
@mahopdong VARCHAR(5), @thoigian DATE, @phantramhoahong FLOAT
AS
BEGIN TRAN
    IF @mahopdong NOT IN (SELECT dbo.HopDong.MaHopDong FROM dbo.HopDong)
    BEGIN
        PRINT 'Hoa Don Nay Khong Ton Tai'
        ROLLBACK TRAN
        RETURN
    END
    UPDATE dbo.HopDong SET ThoiGianHieuLuc = @thoigian WHERE MaHopDong = @mahopdong
    UPDATE dbo.HopDong SET @phantramhoahong = @phantramhoahong WHERE MaHopDong = @mahopdong
COMMIT TRAN

