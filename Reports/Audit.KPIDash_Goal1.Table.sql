USE [Reports]
GO
/****** Object:  Table [Audit].[KPIDash_Goal1]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Audit].[KPIDash_Goal1](
	[AuditRowID] [int] IDENTITY(1,1) NOT NULL,
	[RowID] [int] NOT NULL,
	[Date] [datetime] NULL,
	[UniquePharmacies] [int] NULL,
	[Penetration] [int] NULL,
	[DMLAction] [char](3) NOT NULL,
	[OriginalLogin] [varchar](250) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Audit_KPIDash_Goal1] PRIMARY KEY CLUSTERED 
(
	[AuditRowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Audit].[KPIDash_Goal1] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
