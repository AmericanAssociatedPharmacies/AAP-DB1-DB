USE [reporting]
GO
/****** Object:  Table [dbo].[chph_month_to_date]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_month_to_date](
	[Year] [int] NOT NULL,
	[Store] [varchar](31) NOT NULL,
	[WEEK01] [float] NULL,
	[WEEK02] [float] NULL,
	[WEEK03] [float] NULL,
	[WEEK04] [float] NULL,
	[WEEK05] [float] NULL,
	[WEEK06] [float] NULL,
	[Month] [varchar](2) NOT NULL,
 CONSTRAINT [PK_chph_month_to_date] PRIMARY KEY CLUSTERED 
(
	[Year] ASC,
	[Store] ASC,
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
