USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_storesprograms]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_storesprograms](
	[PMID] [int] NOT NULL,
	[AccountName] [varchar](65) NULL,
	[TM] [varchar](2) NULL,
	[AAP#] [varchar](20) NULL,
	[AAP Eff. Date] [datetime] NULL,
	[API#] [varchar](20) NULL,
	[API Status] [varchar](20) NULL,
	[AAP Elite] [int] NULL,
	[AAP Specialty] [int] NULL,
	[API Customer] [int] NULL,
	[AuditGuard] [int] NULL,
	[Conf 2015] [int] NULL,
	[Generic Adv] [int] NULL,
	[Generic Care] [int] NULL,
	[Managed Care] [int] NULL,
	[MTM] [int] NULL,
	[Rx Care Select] [int] NULL,
	[Compliance Guardian] [int] NULL,
	[Total] [int] NULL
) ON [PRIMARY]
GO
