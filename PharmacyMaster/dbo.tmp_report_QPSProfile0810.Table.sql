USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_report_QPSProfile0810]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_report_QPSProfile0810](
	[PMID] [int] NOT NULL,
	[AAP#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[Name] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[St] [varchar](2) NULL,
	[TM] [varchar](4) NULL,
	[Effective] [datetime] NULL,
	[APIStatus] [varchar](32) NULL,
	[Chain] [int] NULL,
	[M.Care] [varchar](1) NOT NULL,
	[CHSales_Q2] [float] NOT NULL,
	[CHSales_0610] [float] NOT NULL,
	[API_Q2] [numeric](38, 2) NOT NULL,
	[API_0610] [numeric](38, 2) NOT NULL
) ON [PRIMARY]
GO
