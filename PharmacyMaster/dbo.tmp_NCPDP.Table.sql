USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_NCPDP]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NCPDP](
	[Rank] [bigint] NULL,
	[NCPDP] [varchar](20) NULL,
	[pmid] [int] NOT NULL,
	[AAPQuitDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[MCEffectiveDate] [datetime] NULL,
	[IsMCNotNPP] [int] NOT NULL
) ON [PRIMARY]
GO
