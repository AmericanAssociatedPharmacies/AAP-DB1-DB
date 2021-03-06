USE [Purchases]
GO
/****** Object:  Table [dbo].[SourceBackupAll]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SourceBackupAll](
	[Description] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[ AWP ] [nvarchar](50) NULL,
	[ PSB Sell ] [nvarchar](50) NULL,
	[Brand Name] [nvarchar](50) NULL,
	[Form] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[CIN] [nvarchar](50) NULL,
	[DP#] [nvarchar](50) NULL,
	[PricePerUnit] [nvarchar](50) NULL,
	[dateloaded] [smalldatetime] NULL
) ON [PRIMARY]
GO
