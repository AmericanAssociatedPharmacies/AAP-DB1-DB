USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_mnthly_WH_Sales_CS]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_mnthly_WH_Sales_CS](
	[PMID] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[AAPParent#] [varchar](20) NULL,
	[Territory] [varchar](4) NULL,
	[Acct#] [varchar](32) NOT NULL,
	[Status] [varchar](32) NULL,
	[Name] [varchar](65) NULL,
	[ST] [varchar](2) NULL,
	[Date Opened] [datetime] NULL,
	[October BR] [numeric](18, 2) NULL,
	[October GEN] [numeric](18, 2) NULL,
	[October OTC] [numeric](18, 2) NULL,
	[Grand Total] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
