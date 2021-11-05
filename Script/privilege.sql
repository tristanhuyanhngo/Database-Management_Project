--Tạo database role Quản trị viên - Đối tác - Khách Hàng - Tài xế
USE [HTDCHO]
GO
CREATE ROLE quantri
CREATE ROLE doitac
CREATE ROLE khachhang
CREATE ROLE taixe
CREATE ROLE nhanvien

------------------------------------------Create View --------------------------------------------------
GO 
CREATE VIEW UV_DT
AS
SELECT *
FROM dbo.DoiTac dt JOIN  dbo.TaiKhoan tk ON dt.MaSoThue = tk.MaNguoidung
WHERE tk.TenDangNhap = CURRENT_USER 

GO 
CREATE VIEW UV_NV
AS
SELECT *
FROM dbo.NhanVien nv JOIN  dbo.TaiKhoan tk ON nv.MaNhanVien = tk.MaNguoidung
WHERE tk.TenDangNhap = CURRENT_USER 

GO 
CREATE VIEW UV_TX
AS
SELECT *
FROM dbo.TaiXe tx JOIN  dbo.TaiKhoan TK ON tx.MaTaiXe = tk.MaNguoidung
WHERE tk.TenDangNhap = CURRENT_USER 

GO 
CREATE VIEW UV_KH
AS
SELECT *
FROM dbo.KhachHang kh JOIN  dbo.TaiKhoan TK ON kh.MaKhachHang = tk.MaNguoidung
WHERE tk.TenDangNhap = CURRENT_USER 

GO 
CREATE VIEW UV_DHKV
AS
SELECT dh.TenDonHang, dh.NgayDat, dh.TinhTrang, dh.HinhThucThanhToan, dh.KhuVuc, dh.PhiVanChuyen, dh.PhiSanPham, dh.DiaChiGiaoHang
FROM dbo.TaiXe tx, dbo.TaiKhoan tk, dbo.DonHang dh 
WHERE tk.TenDangNhap = CURRENT_USER AND dh.KhuVuc = tx.KhuVucHoatDong AND tx.MaTaiXe = tk.MaNguoiDung

GO 
CREATE VIEW UV_DHDT
AS
SELECT dh.TenDonHang, dh.NgayDat, dh.TinhTrang, dh.HinhThucThanhToan, dh.KhuVuc, dh.PhiVanChuyen, dh.PhiSanPham, dh.DiaChiGiaoHang
FROM dbo.DoiTac dt, dbo.TaiKhoan tk, dbo.DonHang dh 
WHERE tk.TenDangNhap = CURRENT_USER AND dh.MaSoThue = dt.MaSoThue AND dt.MaSoThue = tk.MaNguoiDung

GO
CREATE VIEW UV_SPDT
AS
SELECT sp.*
FROM dbo.DoiTac dt, dbo.TaiKhoan tk, dbo.SanPham sp
WHERE tk.TenDangNhap = CURRENT_USER AND dt.MaSoThue = tk.MaNguoiDung AND dt.MaSoThue = dt.MaSoThue

GO
CREATE VIEW UV_CNDT
AS
SELECT cn.*
FROM dbo.DoiTac dt, dbo.TaiKhoan tk, dbo.ChiNhanh cn
WHERE tk.TenDangNhap = CURRENT_USER AND dt.MaSoThue = tk.MaNguoiDung AND cn.MaSoThue = dt.MaSoThue

GO
CREATE VIEW UV_TBDT
AS
SELECT tb.*
FROM dbo.DoiTac dt, dbo.TaiKhoan tk, dbo.ThongBao tb
WHERE tk.TenDangNhap = CURRENT_USER AND dt.MaSoThue = tk.MaNguoiDung AND tb.MaSoThue = dt.MaSoThue

GO
CREATE VIEW UV_HDDT
AS
SELECT hd.*
FROM dbo.DoiTac dt, dbo.TaiKhoan tk, dbo.HopDong hd
WHERE tk.TenDangNhap = CURRENT_USER AND dt.MaSoThue = tk.MaNguoiDung AND hd.MaSoThue = dt.MaSoThue

GO
CREATE VIEW UV_DHKH
AS
SELECT dh.TenDonHang, dh.TinhTrang, dh.PhiSanPham, dh.PhiVanChuyen, dh.MaTaiXe
FROM dbo.KhachHang kh, dbo.TaiKhoan tk, dbo.DonHang dh
WHERE tk.TenDangNhap = CURRENT_USER AND kh.MaKhachHang = tk.MaNguoiDung AND dh.MaKhachHang = kh.MaKhachHang

------------------------------------Cấp quyền cho quản trị viên-----------------------------------------
Go
ALTER AUTHORIZATION ON SCHEMA::db_accessadmin TO quantri
GRANT DELETE,INSERT,SELECT,UPDATE ON dbo.Admins TO quantri
GRANT DELETE,INSERT,SELECT,UPDATE ON dbo.NhanVien TO quantri
GRANT SELECT,UPDATE ON dbo.DoiTac TO quantri
GRANT SELECT,UPDATE ON dbo.TaiXe TO quantri
GRANT SELECT,UPDATE ON dbo.KhachHang TO quantri

GRANT ALTER ON ROLE::quantri TO quantri
GRANT ALTER ON ROLE::taixe TO quantri
GRANT ALTER ON ROLE::nhanvien TO quantri
GRANT ALTER ON ROLE::khachhang TO quantri
GRANT ALTER ON ROLE::doitac TO quantri

GRANT ALTER ANY USER TO quantri
GRANT DELETE,INSERT,SELECT,UPDATE ON TAIKHOAN TO quantri

------------------------------------Cấp quyền cho Đối tác-----------------------------------------
GRANT DELETE,INSERT,UPDATE ON dbo.UV_SPDT TO doitac
GRANT UPDATE ON dbo.UV_DHDT (TinhTrang) TO doitac
GRANT SELECT ON dbo.UV_DHDT TO doitac
GRANT DELETE,INSERT,UPDATE ON dbo.UV_CNDT TO doitac
GRANT INSERT,UPDATE ON dbo.UV_HDDT TO doitac
GRANT SELECT,UPDATE  ON dbo.UV_DT TO doitac

------------------------------------Cấp quyền cho Khách Hàng-----------------------------------------
GRANT SELECT ON dbo.DoiTac (TenDoiTac,NguoiDaiDien,SDT,ThanhPho,DiaChiKinhDoanh,Email,LoaiHangVanChuyen) TO khachhang
GRANT SELECT ON dbo.SanPham (GiaCa,TenSP,SoLuongTon,GiaCa) TO khachhang
GRANT SELECT ON dbo.UV_DHKH TO khachhang
GRANT SELECT,UPDATE  ON UV_KH TO khachhang

------------------------------------Cấp quyền cho Tài xế-----------------------------------------
GRANT UPDATE ON dbo.UV_DHKV (TinhTrang) TO taixe
GRANT SELECT ON dbo.UV_DHKV TO taixe
GRANT SELECT,UPDATE  ON UV_TX TO taixe

------------------------------------Cấp quyền cho Nhân viên-----------------------------------------
GRANT SELECT ON dbo.DoiTac (MaSoThue,TenDoiTac,SDT,Email) TO nhanvien
GRANT SELECT,UPDATE,DELETE ON dbo.HopDong TO nhanvien
GRANT INSERT ON dbo.ThongBao TO nhanvien
GRANT SELECT,UPDATE  ON UV_NV TO nhanvien

GO
---------------------------------------------ví dụ-------------------------------------------------
--Với lần nhập đơn đăng ký, tạo 1 login và set cho 1 role.
--VÍ DỤ: tạo 5 tài khoản tương ứng với 5 role

--Tạo login
exec sp_addlogin 'Khoa', 'hehe', 'HTDCHO'
exec sp_addlogin 'HAnh', 'hehe', 'HTDCHO'
exec sp_addlogin 'PAnh', 'hehe', 'HTDCHO'
exec sp_addlogin 'Nam', 'hehe', 'HTDCHO'
exec sp_addlogin 'Phat', 'hehe', 'HTDCHO'

--Map tới tên user trong db
GO
CREATE USER quantri1 FOR LOGIN Khoa WITH DEFAULT_SCHEMA=db_securityadmin
ALTER ROLE quantri ADD MEMBER quantri1
GO
CREATE USER doitac1 FOR LOGIN HAnh
ALTER ROLE doitac ADD MEMBER doitac1
GO
CREATE USER khachhang1 FOR LOGIN PAnh
ALTER ROLE khachhang ADD MEMBER khachhang1
GO
CREATE USER taixe1 FOR LOGIN Nam
ALTER ROLE taixe ADD MEMBER taixe1
GO
CREATE USER nhanvien1 FOR LOGIN Phat
ALTER ROLE nhanvien ADD MEMBER nhanvien1