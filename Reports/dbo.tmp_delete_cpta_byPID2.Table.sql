USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_delete_cpta_byPID2]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_cpta_byPID2](
	[yr] [int] NULL,
	[mo] [int] NULL,
	[payee_id] [int] NULL,
	[ncpdp] [varchar](7) NULL,
	[payments] [int] NULL,
	[total_amt] [numeric](38, 2) NULL,
	[check_name] [varchar](50) NULL
) ON [PRIMARY]
GO
