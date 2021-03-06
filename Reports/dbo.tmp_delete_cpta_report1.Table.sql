USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_delete_cpta_report1]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_cpta_report1](
	[yr] [int] NULL,
	[mo] [int] NULL,
	[payee_id] [int] NULL,
	[ncpdp] [varchar](7) NULL,
	[payments] [int] NULL,
	[total_amt] [numeric](38, 2) NULL,
	[check_name] [varchar](50) NULL,
	[avg prev 3 mos] [float] NULL,
	[%change] [float] NULL,
	[11/2010] [numeric](38, 2) NULL,
	[10/2010] [numeric](38, 2) NULL,
	[09/2010] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
