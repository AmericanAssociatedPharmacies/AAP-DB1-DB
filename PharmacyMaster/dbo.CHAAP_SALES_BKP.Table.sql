USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[CHAAP_SALES_BKP]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAAP_SALES_BKP](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[COGAppliedSales] [float] NULL,
	[NetSales] [float] NULL,
	[GENTotal] [float] NULL,
	[GENExcl] [float] NULL,
	[GENSrc] [float] NULL,
	[GENSrcTop] [float] NULL,
	[Brand] [float] NULL,
	[GENCHPreSrcBU] [float] NULL,
	[OTC] [float] NULL,
	[Other] [float] NULL
) ON [PRIMARY]
GO
