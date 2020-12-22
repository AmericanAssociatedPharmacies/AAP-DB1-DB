USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_delete_NCPDP_MCMarketShare]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_NCPDP_MCMarketShare](
	[state] [char](2) NULL,
	[NCPDP_count] [int] NULL,
	[NCPDP_independent_count] [int] NULL,
	[MC_count] [int] NULL,
	[Market_share] [float] NULL
) ON [PRIMARY]
GO
