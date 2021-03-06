USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_pm_peachtree2]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_pm_peachtree2](
	[contact] [varchar](255) NULL,
	[pmid] [int] NULL,
	[Corpname] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[1099Type] [varchar](1) NULL,
	[phone] [varchar](50) NULL,
	[fax] [varchar](50) NULL,
	[email] [varchar](80) NULL,
	[GLExpenseAccount] [varchar](7) NULL,
	[FedID] [varchar](12) NULL,
	[1099Setting] [varchar](1) NULL
) ON [PRIMARY]
GO
