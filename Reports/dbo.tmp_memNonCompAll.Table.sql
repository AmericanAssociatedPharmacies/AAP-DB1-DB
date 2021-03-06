USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_memNonCompAll]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_memNonCompAll](
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
	[WH Aug 20 Vol] [float] NULL,
	[WH Sep 20 Vol] [float] NULL,
	[WH Oct 20 Vol] [float] NULL,
	[WH Nov 20 Vol] [float] NULL,
	[Cardinal Aug 20 Vol] [float] NULL,
	[Cardinal Sep 20 Vol] [float] NULL,
	[Cardinal Oct 20 Vol] [float] NULL,
	[Cardinal Nov 20 Vol] [float] NULL,
	[ML Aug 20 Vol] [float] NULL,
	[ML Sep 20 Vol] [float] NULL,
	[ML Oct 20 Vol] [float] NULL,
	[ML Nov 20 Vol] [float] NULL
) ON [PRIMARY]
GO
