USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_chph_qtr]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_chph_qtr](
	[store] [varchar](50) NOT NULL,
	[Q4_2008] [float] NULL,
	[Q4_2009] [float] NULL,
	[QQ_PCT_CHG] [float] NULL
) ON [PRIMARY]
GO
