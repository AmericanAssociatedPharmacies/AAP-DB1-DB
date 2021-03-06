USE [Reports]
GO
/****** Object:  Table [Audit].[KPIDash_AllyScripts]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Audit].[KPIDash_AllyScripts](
	[AuditRowID] [int] IDENTITY(1,1) NOT NULL,
	[RowID] [int] NOT NULL,
	[AccountName] [varchar](255) NULL,
	[State] [char](2) NULL,
	[AAPAccountNumber] [varchar](255) NULL,
	[APIAccountNumber] [varchar](255) NULL,
	[Date] [datetime] NULL,
	[RxReceived] [int] NULL,
	[RxFilled] [int] NULL,
	[DMLAction] [char](3) NULL,
	[OriginalLogin] [varchar](255) NULL,
	[UserOriginalLogin] [varchar](255) NULL,
	[DeletedBy] [varchar](100) NULL,
	[DeletedOn] [datetime] NULL,
	[IsValid] [bit] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Audit_KPIDash_AllyScripts] PRIMARY KEY CLUSTERED 
(
	[AuditRowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Audit].[KPIDash_AllyScripts] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
