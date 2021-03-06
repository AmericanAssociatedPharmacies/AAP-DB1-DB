USE [reporting]
GO
/****** Object:  Table [dbo].[CHF2Summary]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHF2Summary](
	[Name] [varchar](50) NULL,
	[Address] [varchar](255) NULL,
	[Parent] [varchar](255) NULL,
	[AffNo] [varchar](50) NULL,
	[DC] [varchar](50) NULL,
	[AccNo] [varchar](50) NULL,
	[MasterNo] [float] NULL,
	[AAPStartDate] [datetime] NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](50) NULL,
	[Zip] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[StoreNo] [varchar](50) NULL,
	[DEA] [varchar](50) NULL,
	[DEAExp] [datetime] NULL,
	[SBOP] [float] NULL,
	[SBOPExp] [datetime] NULL,
	[AR2000TermsCode] [varchar](50) NULL,
	[DateDocSentToCCDB] [datetime] NULL,
	[NewAAPAffiliation] [float] NULL,
	[NewRxCOGs] [float] NULL,
	[NewStoreNumber] [varchar](50) NULL,
	[CommittedVolume] [numeric](18, 2) NULL,
	[Terms] [varchar](100) NULL,
	[Notes] [varchar](255) NULL
) ON [PRIMARY]
GO
