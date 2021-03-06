USE [reporting]
GO
/****** Object:  Table [dbo].[PlanDetails_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanDetails_del](
	[PLAN_ID] [int] NULL,
	[NAME] [varchar](50) NULL,
	[BIN_NUM] [char](6) NULL,
	[PROC_ID] [varchar](20) NULL,
	[STREET] [varchar](50) NULL,
	[PO_BOX] [varchar](50) NULL,
	[CITY] [varchar](25) NULL,
	[STATE] [char](2) NULL,
	[ZIP] [varchar](10) NULL,
	[PHONE] [varchar](15) NULL,
	[FAX] [varchar](15) NULL,
	[CONTACT] [varchar](30) NULL,
	[BANK] [varchar](20) NULL,
	[BRANCH] [varchar](20) NULL,
	[ACCOUNT] [varchar](20) NULL,
	[ABBREVIATION] [varchar](30) NULL,
	[PAYEE_ID] [int] NULL
) ON [PRIMARY]
GO
