USE [WebDev]
GO
/****** Object:  Table [dbo].[DIRDetails_Envision]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRDetails_Envision](
	[NCPDP #] [nvarchar](50) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Net Claims Count] [nvarchar](50) NULL,
	[Generic Net Rx Count] [nvarchar](50) NULL,
	[GDR %] [nvarchar](50) NULL,
	[DIR Fee] [nvarchar](50) NULL,
	[DIR Fee Owed] [nvarchar](50) NULL
) ON [PRIMARY]
GO
