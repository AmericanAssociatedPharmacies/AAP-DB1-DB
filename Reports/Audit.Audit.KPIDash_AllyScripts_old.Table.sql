USE [Reports]
GO
/****** Object:  Table [Audit].[Audit.KPIDash_AllyScripts_old]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Audit].[Audit.KPIDash_AllyScripts_old](
	[AuditRowID] [int] IDENTITY(1,1) NOT NULL,
	[RowID] [int] NOT NULL,
	[AccountName] [varchar](255) NULL,
	[State] [char](2) NULL,
	[AAPAccountNumber] [varchar](255) NULL,
	[APIAccountNumber] [varchar](255) NULL,
	[Date] [datetime] NULL,
	[RxReceived] [int] NULL,
	[RxFilled] [int] NULL,
	[RxTransferred] [int] NULL,
	[DMLAction] [char](3) NULL,
	[OriginalLogin] [varchar](255) NULL,
	[UserOriginalLogin] [varchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Audit].[Audit.KPIDash_AllyScripts_old] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
