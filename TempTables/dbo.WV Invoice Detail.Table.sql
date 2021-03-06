USE [TempTables]
GO
/****** Object:  Table [dbo].[WV Invoice Detail]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WV Invoice Detail](
	[API Customer #] [nvarchar](11) NULL,
	[Pharmacy Name] [nvarchar](30) NULL,
	[Pharmacy Contact] [nvarchar](20) NULL,
	[Address1] [nvarchar](35) NULL,
	[Address2] [nvarchar](35) NULL,
	[City] [nvarchar](35) NULL,
	[ST] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[DEA#] [nvarchar](255) NULL,
	[Inv Date] [nvarchar](255) NULL,
	[Inv#] [decimal](7, 0) NULL,
	[NDC] [nvarchar](15) NULL,
	[API#] [nvarchar](255) NULL,
	[Desc1] [nvarchar](255) NULL,
	[Desc2] [nvarchar](30) NULL,
	[Qty] [float] NULL,
	[Price] [float] NULL,
	[Amt] [float] NULL
) ON [PRIMARY]
GO
