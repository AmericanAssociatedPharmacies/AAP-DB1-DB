USE [PharmacyMaster]
GO
/****** Object:  Table [Audit].[PM_AddressMaster]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Audit].[PM_AddressMaster](
	[AuditRowID] [int] IDENTITY(1,1) NOT NULL,
	[PK_AddressMaster] [int] NOT NULL,
	[PMID] [int] NOT NULL,
	[Address_Type_Id] [int] NOT NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](100) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Fax] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[AlternatePhone] [varchar](12) NULL,
	[Email] [varchar](150) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[DMLAction] [varchar](5) NULL,
	[ColumnsUpdated] [varchar](4000) NULL,
	[OriginalLogin] [varchar](255) NULL,
	[CurrentLogin] [varchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[IsSentToCRM] [bit] NOT NULL,
	[IsUpdatedInCRM] [bit] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
 CONSTRAINT [CPK_Audit_PM_AddressMaster] PRIMARY KEY CLUSTERED 
(
	[AuditRowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Audit].[PM_AddressMaster] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Audit].[PM_AddressMaster] ADD  DEFAULT ((0)) FOR [IsSentToCRM]
GO
ALTER TABLE [Audit].[PM_AddressMaster] ADD  DEFAULT ((0)) FOR [IsUpdatedInCRM]
GO
