USE [AAP]
GO
/****** Object:  Table [dbo].[tmp_q4_pm_rpt_jmw]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_q4_pm_rpt_jmw](
	[AAP #] [varchar](20) NULL,
	[UD #] [varchar](5) NULL,
	[Name] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](10) NULL,
	[Territory] [varchar](5) NULL,
	[Effective] [varchar](12) NULL,
	[Oct. 2009] [numeric](38, 2) NULL,
	[Nov. 2009] [numeric](38, 2) NULL,
	[Dec. 2009] [numeric](38, 2) NULL,
	[Q4 2009 Total] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
