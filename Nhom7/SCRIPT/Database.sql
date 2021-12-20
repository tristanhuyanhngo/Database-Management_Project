CREATE DATABASE HTDCHO
GO 
USE HTDCHO
GO
--------------------------------------Create table ---------------------------------------
create TABLE DoiTac
(
	MaSoThue int PRIMARY KEY identity,
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
	MaHopDong int PRIMARY KEY identity,
	MaSoThue int NOT NULL,
	SoChiNhanhDangKy INT,
	PhanTramHoaHong FLOAT,
	ThoiGianHieuLuc DATE,
	TinhTrang NVARCHAR(50),
	CHECK (TinhTrang IN (N'Đã duyệt', N'Chờ duyệt', N'Huỷ')),
	CHECK (PhanTramHoaHong >= 0 and PhanTramHoaHong<=100)
)

create TABLE ChiTietHopDong
(
	MaHopDong int,
	MaChiNhanh int,
	PRIMARY KEY(MaHopDong,MaChiNhanh)
)

create TABLE DonHang
(
	MaDonHang int PRIMARY KEY identity,
	TenDonHang NVARCHAR(50),
	NgayDat DATE,
	TinhTrang NVARCHAR(50),
	KhuVuc NVARCHAR(50),
	PhiVanChuyen INT,
	PhiSanPham INT,
	HinhThucThanhToan NVARCHAR(50),
	DiaChiGiaoHang NVARCHAR(50),
	MaKhachHang int NOT NULL,
	MaSoThue int NOT NULL,
	MaTaiXe int,
	CHECK (TinhTrang IN (N'Đã giao', N'Đang giao',N'Chờ')),
	CHECK (HinhThucThanhToan IN (N'COD', N'VISA',N'MOMO'))
)

create TABLE KhachHang
(
	MaKhachHang int PRIMARY KEY identity,
	HoTen NVARCHAR(50),
	SDT VARCHAR(50),
	DiaChi NVARCHAR(50),
	Email VARCHAR(50)
)

CREATE TABLE TaiXe
(
	MaTaiXe int PRIMARY KEY identity,
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
	MaChiNhanh int PRIMARY KEY identity,
	MaSoThue int NOT NULL,
	TenChiNhanh NVARCHAR(50),
	DiaChi NVARCHAR(50)
)

CREATE TABLE ThongBao
(
	MaThongBao int PRIMARY KEY identity,
	NoiDung NVARCHAR(50),
	MaSoThue int NOT NULL
)

CREATE TABLE NhanVien
(
	MaNhanVien int PRIMARY KEY identity,
	HoTen NVARCHAR(50),
	SDT VARCHAR(10),
	DiaChi NVARCHAR(50),
	Email VARCHAR(50)
)

CREATE TABLE Admins
(
	MaAdmin  int PRIMARY KEY identity,
	HoTen NVARCHAR(50),
	SDT VARCHAR(10),
	DiaChi NVARCHAR(50),
	Email VARCHAR(50)
)


CREATE TABLE SanPham
(
	MaSP  int PRIMARY KEY identity,
	MaChiNhanh int  NOT NULL,
	SoLuongTon INT,
	GiaCa INT,
	TenSP VARCHAR(50)
)

CREATE TABLE DHSP
(
	MaDonHang int not null,
	MaSP int not null,
	SoLuong INT,
	Gia INT,
	PRIMARY KEY(MaSP,MaDonHang)
)

CREATE TABLE TaiKhoan
(
	MaNguoidung int PRIMARY KEY identity,
	TenDangNhap VARCHAR(50) UNIQUE,
	MatKhau VARCHAR(50),
	LoaiNguoiDung int,
	TinhTrang NVARCHAR(50),
	nguoidung int,
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

ALTER TABLE dbo.ChiTietHopDong
ADD CONSTRAINT FK_CTHD_HD
FOREIGN KEY (MaHopDong)
REFERENCES dbo.HopDong(MaHopDong)

ALTER TABLE dbo.ChiTietHopDong
ADD CONSTRAINT FK_CTHD_CN
FOREIGN KEY (MaChiNhanh)
REFERENCES dbo.ChiNhanh(MaChiNhanh)

ALTER TABLE dbo.chinhanh
ADD CONSTRAINT FK_CN_DT
FOREIGN KEY (MaSoThue)
REFERENCES dbo.DoiTac(MaSoThue)
----------------------------------------Trigger-------------------------------------------
GO 
create function fn_sochinhanh (@masothue int)
returns int
begin
	return (select COUNT(dbo.ChiNhanh.MaChiNhanh) FROM dbo.ChiNhanh WHERE dbo.ChiNhanh.masothue =  @masothue)
END
go
CREATE TRIGGER tg_ChiNhanhTong
ON dbo.ChiNhanh FOR INSERT,UPDATE
as
BEGIN
	IF (exists(SELECT * FROM dbo.DoiTac,Inserted 
					WHERE Inserted.MaSoThue = dbo.DoiTac.MaSoThue 
					and dbo.fn_sochinhanh(inserted.masothue) > SoChiNhanh))
	BEGIN
		PRINT N'Đã đủ số chi nhánh, không thể thêm'
		delete ChiNhanh from inserted where Inserted.machinhanh = dbo.ChiNhanh.machinhanh
	END
END

-- Mỗi sản phẩm có 1 số lượng nhất định, nếu thêm sửa số lượng mà vượt quá số hiện tại thì huỷ
-- giá = giá sản phẩm * số lượng
-- phí sản phẩm từ bảng đơn hàng = sum(đơn giá)
GO 
create function fn_dongia (@madh int, @masp int)
returns int
begin
	return (select sanpham.giaca*soluong
	from sanpham, DHSP 
	where sanpham.masp = DHSP.masp and DHSP.masp = @masp and DHSP.madonhang = @madh) 
END
go
create function fn_phisanpham (@madh int)
returns int
begin
	return (select SUM(gia)
	from DHSP 
	where DHSP.madonhang = @madh) 
END

go
CREATE TRIGGER tg_LuongDatHang
ON dbo.DHSP FOR INSERT,UPDATE
as
BEGIN
    DECLARE @sosanpham INT
	SELECT @sosanpham = DHSP.SoLuong FROM dbo.DHSP, Inserted WHERE Inserted.MaSP = DHSP.MaSP and inserted.madonhang = DHSP.madonhang

	DECLARE @SoLuongTon INT
	SELECT @SoLuongTon = SoLuongTon FROM dbo.SanPham,Inserted,DHSP WHERE dbo.SanPham.masp = Inserted.masp and inserted.masp = DHSP.masp and inserted.madonhang = DHSP.madonhang

	IF (@sosanpham> @SoLuongTon)
	BEGIN
	    PRINT N'Không thể đặt thêm'
		ROLLBACK
		return
	END
	begin tran
	update DHSP set gia = dbo.fn_dongia (DHSP.madonhang, DHSP.masp) from DHSP,inserted where inserted.masp = DHSP.masp and inserted.madonhang = DHSP.madonhang
	update donhang set phisanpham = dbo.fn_phisanpham(inserted.madonhang) from donhang,inserted where inserted.madonhang = donhang.madonhang
	commit tran
END


-- Mỗi đối tác có số lượng đơn giao nhất định cho mỗi ngày nếu đã đủ thì không giao thêm đơn nào nữa
GO 
CREATE TRIGGER tg_DonHangHangNgay
ON dbo.DonHang FOR INSERT
as
BEGIN
    DECLARE @soDH INT

	SELECT @soDH = COUNT(dbo.DonHang.MaDonHang) FROM dbo.DonHang,Inserted 
	WHERE Inserted.MaSoThue = dbo.DonHang.MaSoThue 
	AND DAY(dbo.DonHang.ngaydat) =  DAY(GETDATE())
	AND MONTH(dbo.DonHang.ngaydat) =  MONTH(GETDATE())
	AND YEAR(dbo.DonHang.ngaydat) =  YEAR(GETDATE())

	declare @dhhn INT
	SELECT @dhhn = SoLuongDonHangMoiNgay FROM dbo.DoiTac, Inserted WHERE Inserted.MaSoThue = dbo.DoiTac.MaSoThue

	IF (@soDH > @dhhn)
	BEGIN
	    PRINT N'Không thể đặt thêm đơn hàng vì đã vượt quá số lượng đơn của đối tác'
		ROLLBACK
		return
	END
END

GO

create function fn_sochinhanhdadangky (@mahd int)
returns int
begin
	return (select count(*)
	from ChiTietHopDong
	where ChiTietHopDong.mahopdong = @mahd) 
end

go
-- Chi nhánh đăng ký phải là của đối tác 
CREATE TRIGGER tg_ChiNhanhDangKy
ON dbo.ChiTietHopDong 
INSTEAD OF INSERT, update
as
BEGIN
    insert into ChiTietHopDong(mahopdong,machinhanh)
	select
	inserted.mahopdong,inserted.machinhanh
	from inserted, hopdong,chinhanh
	where inserted.mahopdong = hopdong.mahopdong
	and inserted.machinhanh = chinhanh.machinhanh
	and hopdong.masothue = chinhanh.masothue
END
go



