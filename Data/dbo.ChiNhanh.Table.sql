USE [HTDCHO]
GO
/****** Object:  Table [dbo].[ChiNhanh]    Script Date: 12/15/2021 9:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiNhanh](
	[MaChiNhanh] [int] IDENTITY(1,1) NOT NULL,
	[MaSoThue] [int] NOT NULL,
	[TenChiNhanh] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiNhanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiNhanh]  WITH CHECK ADD  CONSTRAINT [FK_CN_DT] FOREIGN KEY([MaSoThue])
REFERENCES [dbo].[DoiTac] ([MaSoThue])
GO
ALTER TABLE [dbo].[ChiNhanh] CHECK CONSTRAINT [FK_CN_DT]
GO
