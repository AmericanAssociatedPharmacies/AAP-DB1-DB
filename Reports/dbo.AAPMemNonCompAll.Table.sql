USE [Reports]
GO
/****** Object:  Table [dbo].[AAPMemNonCompAll]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPMemNonCompAll](
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
	[WH Prev 3 Mo Vol] [float] NULL,
	[WH Prev 2 Mo Vol] [float] NULL,
	[WH Prev 1 Mo Vol] [float] NULL,
	[WH Current Mo Vol] [float] NULL,
	[Cardinal Prev 3 Mo Vol] [float] NULL,
	[Cardinal Prev 2 Mo Vol] [float] NULL,
	[Cardinal  Prev 1 Mo Vol] [float] NULL,
	[Cardinal  Current Mo Vol] [float] NULL,
	[ML Prev 3 Mo Vol] [float] NULL,
	[ML Prev 2 Mo Vol] [float] NULL,
	[ML Prev 1 Mo Vol] [float] NULL,
	[ML  Current Mo Vol] [float] NULL
) ON [PRIMARY]
GO
