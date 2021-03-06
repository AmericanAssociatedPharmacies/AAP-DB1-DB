USE [AAP]
GO
/****** Object:  Table [dbo].[CAH_AAP_Accounts]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAH_AAP_Accounts](
	[LastName_CHRep] [varchar](100) NULL,
	[FirstName_CHRep] [varchar](50) NULL,
	[DivNo] [float] NULL,
	[CustNo] [float] NULL,
	[CustName] [varchar](255) NULL,
	[ShipToPrimaryContactName] [varchar](255) NULL,
	[AffiliationNo] [float] NULL,
	[AffiliationName] [varchar](255) NULL,
	[DEA] [varchar](20) NULL,
	[NCPDP] [varchar](20) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Zip] [varchar](50) NULL,
	[Type] [varchar](10) NULL
) ON [PRIMARY]
GO
