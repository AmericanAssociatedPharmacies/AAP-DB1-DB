USE [TempTables]
GO
/****** Object:  Table [dbo].[rlgl_tmp_dates]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rlgl_tmp_dates](
	[ncpdp] [nvarchar](50) NULL,
	[min_rx_date] [datetime] NULL,
	[max_rx_date] [datetime] NULL,
	[claim_count] [int] NULL
) ON [PRIMARY]
GO
