USE [Reports]
GO
/****** Object:  Table [dbo].[AAPMemNonCompAll_bkp]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPMemNonCompAll_bkp](
	[Date] [datetime] NULL,
	[PMID] [int] NOT NULL,
	[Account DBA Name] [varchar](100) NULL,
	[AAP#] [varchar](20) NULL,
	[City] [varchar](100) NULL,
	[ST] [varchar](100) NULL,
	[TM] [varchar](10) NULL,
	[AAP Eff] [varchar](10) NULL,
	[API#] [varchar](20) NULL,
	[Description] [varchar](200) NULL,
	[Affiliate] [varchar](200) NULL,
	[AAP Elite] [varchar](200) NULL,
	[Warehouse Active] [varchar](20) NULL,
	[Cardinal/ML Status] [varchar](20) NULL,
	[IsManagedCare] [varchar](20) NULL,
	[Is LTC] [varchar](20) NULL,
	[WH Dec 10 Vol] [float] NULL,
	[WH Jan 11 Vol] [float] NULL,
	[WH Feb 11 Vol] [float] NULL,
	[WH Mar 11 Vol] [float] NULL,
	[Cardinal Dec 10 Vol] [float] NULL,
	[Cardinal Jan 11 Vol] [float] NULL,
	[Cardinal Feb 11 Vol] [float] NULL,
	[Cardinal Mar 11 Vol] [float] NULL,
	[ML Dec 10 Vol] [float] NULL,
	[ML Jan 11 Vol] [float] NULL,
	[ML Feb 11 Vol] [float] NULL,
	[ML Mar 11 Vol] [float] NULL
) ON [PRIMARY]
GO
