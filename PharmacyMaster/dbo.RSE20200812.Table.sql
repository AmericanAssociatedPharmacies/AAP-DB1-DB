USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[RSE20200812]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSE20200812](
	[new_PMID] [nvarchar](100) NULL,
	[new_apideactivation] [date] NULL,
	[OriginalAPIAccountNumber] [varchar](100) NULL,
	[new_api_historical] [nvarchar](255) NULL
) ON [PRIMARY]
GO
