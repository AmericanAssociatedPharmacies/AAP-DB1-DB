USE [reporting]
GO
/****** Object:  Table [dbo].[API Item List]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API Item List](
	[API NDC] [nvarchar](255) NULL,
	[API GPI] [nvarchar](255) NULL,
	[API DRUG NAME] [nvarchar](255) NULL,
	[API FORM] [nvarchar](255) NULL,
	[API SIZE] [nvarchar](255) NULL,
	[API MFG] [nvarchar](255) NULL,
	[API QTY] [float] NULL,
	[NDC to MATCH] [nvarchar](255) NULL,
	[MFG NDC TO MATCH] [nvarchar](255) NULL,
	[NDC Description] [nvarchar](255) NULL,
	[NDC Size] [nvarchar](255) NULL,
	[NDC Form] [nvarchar](255) NULL
) ON [PRIMARY]
GO
