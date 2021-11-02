--Tạo database role Quản trị viên - Đối tác - Khách Hàng - Tài xế
USE [HTDCHO]
GO
CREATE ROLE [quantri]
CREATE ROLE [doitac]
CREATE ROLE [khachhang]
CREATE ROLE [taixe]
CREATE ROLE [nhanvien]
GO 
------------------------------------Cấp quyền cho quản trị viên-----------------------------------------
ALTER AUTHORIZATION ON SCHEMA::[db_accessadmin] TO [quantri]
GRANT DELETE ON [dbo].[Admins] TO [quantri]
GRANT INSERT ON [dbo].[Admins] TO [quantri]
GRANT SELECT ON [dbo].[Admins] TO [quantri]
GRANT UPDATE ON [dbo].[Admins] TO [quantri]
GRANT DELETE ON [dbo].[NhanVien] TO [quantri]
GRANT INSERT ON [dbo].[NhanVien] TO [quantri]
GRANT SELECT ON [dbo].[NhanVien] TO [quantri]
GRANT UPDATE ON [dbo].[NhanVien] TO [quantri]
GRANT SELECT ON [dbo].[TaiXe] TO [quantri]
GRANT UPDATE ON [dbo].[TaiXe] TO [quantri]
GRANT ALTER ON ROLE::[quantri] TO [quantri]
GRANT SELECT ON [dbo].[KhachHang] TO [quantri]
GRANT UPDATE ON [dbo].[KhachHang] TO [quantri]
GRANT ALTER ON ROLE::[taixe] TO [quantri]
GRANT ALTER ON ROLE::[nhanvien] TO [quantri]
GRANT ALTER ON ROLE::[khachhang] TO [quantri]
GRANT SELECT ON [dbo].[DoiTac] TO [quantri]
GRANT UPDATE ON [dbo].[DoiTac] TO [quantri]
GRANT ALTER ON ROLE::[doitac] TO [quantri]
GRANT ALTER ANY USER TO [quantri]


------------------------------------Cấp quyền cho Đối tác-----------------------------------------
GRANT DELETE ON [dbo].[SanPham] TO [doitac]
GRANT INSERT ON [dbo].[SanPham] TO [doitac]
GRANT UPDATE ON [dbo].[SanPham] TO [doitac]
GRANT UPDATE ON [dbo].[DonHang] ([TinhTrang]) TO [doitac]
GRANT INSERT ON [dbo].[DoiTac] TO [doitac]
GRANT SELECT ON [dbo].[DonHang] TO [doitac]
GRANT DELETE ON [dbo].[ChiNhanh] TO [doitac]
GRANT REFERENCES ON [dbo].[ChiNhanh] TO [doitac]
GRANT UPDATE ON [dbo].[ChiNhanh] TO [doitac]
GRANT INSERT ON [dbo].[HopDong] TO [doitac]
GRANT UPDATE ON [dbo].[HopDong] TO [doitac]

------------------------------------Cấp quyền cho Khách Hàng-----------------------------------------
GRANT SELECT ON [dbo].[DoiTac] ([TenDoiTac]) TO [khachhang]
GRANT SELECT ON [dbo].[DoiTac] ([NguoiDaiDien]) TO [khachhang]
GRANT SELECT ON [dbo].[SanPham] ([GiaCa]) TO [khachhang]
GRANT SELECT ON [dbo].[SanPham] ([TenSP]) TO [khachhang]
GRANT SELECT ON [dbo].[SanPham] ([SoLuongTon]) TO [khachhang]
GRANT SELECT ON [dbo].[DoiTac] ([SDT]) TO [khachhang]
GRANT SELECT ON [dbo].[DoiTac] ([ThanhPho]) TO [khachhang]
GRANT SELECT ON [dbo].[DonHang] ([TinhTrang]) TO [khachhang]
GRANT SELECT ON [dbo].[SanPham] ([GiaCa]) TO [khachhang]
GRANT SELECT ON [dbo].[DoiTac] ([DiaChiKinhDoanh]) TO [khachhang]
GRANT SELECT ON [dbo].[DoiTac] ([Email]) TO [khachhang]
GRANT SELECT ON [dbo].[DonHang] ([TenDonHang]) TO [khachhang]
GRANT SELECT ON [dbo].[DoiTac] ([LoaiHangVanChuyen]) TO [khachhang]
GRANT INSERT ON [dbo].[KhachHang] TO [khachhang]

------------------------------------Cấp quyền cho Tài xế-----------------------------------------
GRANT UPDATE ON [dbo].[DonHang] ([TinhTrang]) TO [taixe]
GRANT INSERT ON [dbo].[TaiXe] TO [taixe]
GRANT SELECT ON [dbo].[DonHang] TO [taixe]

------------------------------------Cấp quyền cho Nhân viên-----------------------------------------
GRANT SELECT ON [dbo].[DoiTac] ([MaSoThue]) TO [nhanvien]
GRANT SELECT ON [dbo].[DoiTac] ([TenDoiTac]) TO [nhanvien]
GRANT SELECT ON [dbo].[DoiTac] ([SDT]) TO [nhanvien]
GRANT SELECT ON [dbo].[DoiTac] ([Email]) TO [nhanvien]
GRANT SELECT ON [dbo].[HopDong] TO [nhanvien]

GO

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
CREATE USER [quantri1] FOR LOGIN [Khoa] WITH DEFAULT_SCHEMA=[db_securityadmin]
ALTER ROLE [quantri] ADD MEMBER [quantri1]


GO
CREATE USER [doitac1] FOR LOGIN [HAnh]
ALTER ROLE [doitac] ADD MEMBER [doitac1]


GO
CREATE USER [khachhang1] FOR LOGIN [PAnh]
ALTER ROLE [khachhang] ADD MEMBER [khachhang1]


GO
CREATE USER [taixe1] FOR LOGIN [Nam]
ALTER ROLE [taixe] ADD MEMBER [taixe1]


GO
CREATE USER [nhanvien1] FOR LOGIN [Phat]
ALTER ROLE [nhanvien] ADD MEMBER [nhanvien1]