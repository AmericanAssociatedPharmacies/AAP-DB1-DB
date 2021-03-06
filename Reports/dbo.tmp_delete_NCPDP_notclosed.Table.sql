USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_delete_NCPDP_notclosed]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_NCPDP_notclosed](
	[NCPDP_ID] [int] NULL,
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
	[DELETE_DT] [datetime] NULL,
	[ADDRESS_ID] [int] NULL,
	[STREET_ADDRESS] [varchar](55) NULL,
	[ADDITIONAL] [varchar](55) NULL,
	[CITY] [varchar](30) NULL,
	[STATE] [char](2) NULL,
	[ZIP] [char](9) NULL,
	[CROSSROADS] [varchar](50) NULL,
	[FIPS] [char](5) NULL
) ON [PRIMARY]
GO
