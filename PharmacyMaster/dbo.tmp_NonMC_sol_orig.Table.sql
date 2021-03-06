USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_NonMC_sol_orig]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NonMC_sol_orig](
	[pmid] [int] NOT NULL,
	[aapaccountno] [varchar](20) NULL,
	[accountname] [varchar](65) NULL,
	[aapeffectivedate] [datetime] NULL,
	[aapquitdate] [datetime] NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[contactfullname] [varchar](255) NULL,
	[ncpdp] [varchar](20) NULL,
	[fedid] [varchar](12) NULL,
	[corporateName] [varchar](100) NULL
) ON [PRIMARY]
GO
