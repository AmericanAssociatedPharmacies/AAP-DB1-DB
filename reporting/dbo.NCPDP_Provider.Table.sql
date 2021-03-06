USE [reporting]
GO
/****** Object:  Table [dbo].[NCPDP_Provider]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_Provider](
	[PROVIDER_ID] [int] NULL,
	[LOC_CONTACT_ID] [int] NULL,
	[NCPDP] [varchar](9) NULL,
	[BUSINESS_NAME] [varchar](60) NULL,
	[NAME] [varchar](60) NULL,
	[STORE_NUMBER] [varchar](10) NULL,
	[MSA] [varchar](4) NULL,
	[PMSA] [varchar](4) NULL,
	[HOURS] [varchar](35) NULL,
	[VOTING_DISTRICT] [varchar](4) NULL,
	[OPEN_DT] [datetime] NULL,
	[CLOSE_DT] [datetime] NULL,
	[DISPENSER_CLASS_CODE] [char](2) NULL,
	[CONTACT_ID] [int] NULL,
	[MEDICARE_PROVIDER_ID] [varchar](10) NULL,
	[NPI] [varchar](10) NULL,
	[DEA] [varchar](12) NULL,
	[EIN] [varchar](15) NULL,
	[STATE_LIC] [varchar](20) NULL,
	[STATE_TAX_ID] [varchar](15) NULL,
	[DELETE_DT] [datetime] NULL
) ON [PRIMARY]
GO
