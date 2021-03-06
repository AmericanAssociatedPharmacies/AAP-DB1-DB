USE [API]
GO
/****** Object:  Table [dbo].[tmp_WSAPIPrice]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_WSAPIPrice](
	[API Item #] [nvarchar](255) NULL,
	[NDC #] [nvarchar](255) NULL,
	[Item Description] [nvarchar](255) NULL,
	[Unit] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[Contract] [nvarchar](255) NULL,
	[API Price] [money] NULL,
	[billable cost] [float] NULL,
	[GPI] [nvarchar](255) NULL
) ON [PRIMARY]
GO
