USE [Reports]
GO
/****** Object:  Table [Audit].[Audit.KPIDash_Accounting_old]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Audit].[Audit.KPIDash_Accounting_old](
	[AuditRowID] [int] IDENTITY(1,1) NOT NULL,
	[RowID] [int] NULL,
	[RebateDate] [date] NULL,
	[GenericLoyaltyAmount] [money] NULL,
	[PatronageDividendAmount] [money] NULL,
	[UserOriginalLogin] [varchar](255) NULL,
	[DMLAction] [char](3) NULL,
	[OriginalLogin] [varchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Audit].[Audit.KPIDash_Accounting_old] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
