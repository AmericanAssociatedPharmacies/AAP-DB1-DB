USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_sum_chph_1]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_sum_chph_1](
	[ID] [int] NOT NULL,
	[STORE] [varchar](31) NULL,
	[EXT_COST] [float] NULL,
	[MONTH_DATE] [int] NULL
) ON [PRIMARY]
GO
