USE [HTDCHO]
GO
/****** Object:  Table [dbo].[HopDong]    Script Date: 12/15/2021 9:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HopDong](
	[MaHopDong] [int] IDENTITY(1,1) NOT NULL,
	[MaSoThue] [int] NOT NULL,
	[SoChiNhanhDangKy] [int] NULL,
	[PhanTramHoaHong] [float] NULL,
	[ThoiGianHieuLuc] [date] NULL,
	[TinhTrang] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHopDong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD  CONSTRAINT [FK_HD_DT] FOREIGN KEY([MaSoThue])
REFERENCES [dbo].[DoiTac] ([MaSoThue])
GO
ALTER TABLE [dbo].[HopDong] CHECK CONSTRAINT [FK_HD_DT]
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD CHECK  (([PhanTramHoaHong]>=(0) AND [PhanTramHoaHong]<=(100)))
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD CHECK  (([TinhTrang]=N'Huỷ' OR [TinhTrang]=N'Chờ duyệt' OR [TinhTrang]=N'Đã duyệt'))
GO
