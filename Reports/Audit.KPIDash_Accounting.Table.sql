USE [Reports]
GO
/****** Object:  Table [Audit].[KPIDash_Accounting]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Audit].[KPIDash_Accounting](
	[AuditRowID] [int] IDENTITY(1,1) NOT NULL,
	[RowID] [int] NULL,
	[RebateDate] [date] NULL,
	[RebateType] [varchar](100) NULL,
	[RebateAmount] [money] NULL,
	[UserOriginalLogin] [varchar](255) NULL,
	[DeletedBy] [varchar](100) NULL,
	[DeletedOn] [datetime] NULL,
	[IsValid] [bit] NULL,
	[DMLAction] [char](3) NULL,
	[OriginalLogin] [varchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Audit_KPIDash_Accounting] PRIMARY KEY CLUSTERED 
(
	[AuditRowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Audit].[KPIDash_Accounting] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
