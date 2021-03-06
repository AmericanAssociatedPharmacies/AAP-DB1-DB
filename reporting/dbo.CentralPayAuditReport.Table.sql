USE [reporting]
GO
/****** Object:  Table [dbo].[CentralPayAuditReport]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CentralPayAuditReport](
	[ncpdp] [char](7) NULL,
	[pmid] [int] NULL,
	[accountname] [varchar](65) NULL,
	[TM] [varchar](71) NULL,
	[plan_id] [int] NULL,
	[plan_name] [varchar](50) NULL,
	[min_date] [datetime] NULL,
	[NPI] [varchar](50) NULL,
	[MCEffectivedate] [datetime] NULL
) ON [PRIMARY]
GO
