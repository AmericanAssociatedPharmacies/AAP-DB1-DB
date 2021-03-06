USE [API]
GO
/****** Object:  Table [dbo].[apicustomersAI]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apicustomersAI](
	[APIAccountNo] [varchar](50) NULL,
	[APICustomerStatus] [varchar](5) NULL,
	[APIType] [varchar](5) NULL,
	[APIAccountName] [varchar](250) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](4) NULL,
	[Zip] [varchar](20) NULL,
	[Contact] [varchar](50) NULL,
	[Email] [varchar](75) NULL,
	[MemNum] [varchar](12) NULL,
	[NCPDP] [varchar](7) NULL,
	[NPI] [varchar](20) NULL,
	[EffectiveDate] [datetime] NULL,
	[Phone] [varchar](30) NULL,
	[Fax] [varchar](30) NULL,
	[DEA] [varchar](50) NULL,
	[CustomerStatus] [varchar](12) NULL,
	[Territory] [varchar](5) NULL
) ON [PRIMARY]
GO
