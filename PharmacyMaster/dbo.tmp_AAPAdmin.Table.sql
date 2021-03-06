USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_AAPAdmin]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAPAdmin](
	[month] [varchar](6) NOT NULL,
	[pmid] [int] NULL,
	[aapaccountno] [nvarchar](255) NULL,
	[apiaccountno] [nvarchar](255) NULL,
	[ca#] [float] NULL,
	[name] [nvarchar](255) NULL,
	[dc] [float] NULL,
	[division] [nvarchar](255) NULL,
	[store] [nvarchar](255) NULL,
	[metrics] [nvarchar](255) NULL,
	[Gen_Qualified] [money] NULL,
	[Gen_Excluded] [money] NULL,
	[Gen_Total] [money] NULL,
	[Brand] [money] NULL,
	[Extended] [money] NULL,
	[AdminFee] [money] NULL
) ON [PRIMARY]
GO
