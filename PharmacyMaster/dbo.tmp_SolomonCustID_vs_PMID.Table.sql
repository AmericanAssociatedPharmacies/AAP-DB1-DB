USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_SolomonCustID_vs_PMID]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SolomonCustID_vs_PMID](
	[pmid] [int] NOT NULL,
	[custid] [char](15) NULL,
	[ncpdp] [varchar](20) NULL,
	[accountname] [varchar](65) NULL,
	[dba] [varchar](100) NULL,
	[name] [char](60) NULL,
	[billname] [char](60) NULL
) ON [PRIMARY]
GO
