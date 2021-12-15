USE [HTDCHO]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 12/15/2021 9:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[TenDonHang] [nvarchar](50) NULL,
	[NgayDat] [date] NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[KhuVuc] [nvarchar](50) NULL,
	[PhiVanChuyen] [int] NULL,
	[PhiSanPham] [int] NULL,
	[HinhThucThanhToan] [nvarchar](50) NULL,
	[DiaChiGiaoHang] [nvarchar](50) NULL,
	[MaKhachHang] [int] NOT NULL,
	[MaSoThue] [int] NOT NULL,
	[MaTaiXe] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DH_DT] FOREIGN KEY([MaSoThue])
REFERENCES [dbo].[DoiTac] ([MaSoThue])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DH_DT]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DH_KH] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DH_KH]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DH_TX] FOREIGN KEY([MaTaiXe])
REFERENCES [dbo].[TaiXe] ([MaTaiXe])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DH_TX]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD CHECK  (([HinhThucThanhToan]=N'MOMO' OR [HinhThucThanhToan]=N'VISA' OR [HinhThucThanhToan]=N'COD'))
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD CHECK  (([TinhTrang]=N'Chờ' OR [TinhTrang]=N'Đang giao' OR [TinhTrang]=N'Đã giao'))
GO
