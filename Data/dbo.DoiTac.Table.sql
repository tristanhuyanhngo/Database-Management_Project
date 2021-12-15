USE [HTDCHO]
GO
/****** Object:  Table [dbo].[DoiTac]    Script Date: 12/15/2021 9:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoiTac](
	[MaSoThue] [int] IDENTITY(1,1) NOT NULL,
	[TenDoitac] [nvarchar](50) NULL,
	[NguoiDaiDien] [nvarchar](50) NULL,
	[ThanhPho] [nvarchar](50) NULL,
	[Quan] [nvarchar](50) NULL,
	[SoChiNhanh] [int] NULL,
	[SoLuongDonHangMoiNgay] [int] NULL,
	[LoaiHangVanChuyen] [nvarchar](50) NULL,
	[DiaChiKinhDoanh] [nvarchar](50) NULL,
	[SDT] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSoThue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
