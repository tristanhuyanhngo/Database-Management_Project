USE [HTDCHO]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/15/2021 9:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaNguoidung] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[LoaiNguoiDung] [int] NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[nguoidung] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNguoidung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD CHECK  (([LoaiNguoiDung]=(5) OR [LoaiNguoiDung]=(4) OR [LoaiNguoiDung]=(3) OR [LoaiNguoiDung]=(2) OR [LoaiNguoiDung]=(1)))
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD CHECK  (([TinhTrang]=N'Mở' OR [TinhTrang]=N'Khoá'))
GO
