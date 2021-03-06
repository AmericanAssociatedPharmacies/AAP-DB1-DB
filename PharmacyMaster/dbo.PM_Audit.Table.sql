USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_Audit]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Audit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [nvarchar](7) NOT NULL,
	[DateUDNotified] [datetime] NULL,
	[NotifyType] [nvarchar](50) NULL,
	[DateAuditNotice] [datetime] NULL,
	[AuditDate] [datetime] NULL,
	[AuditTypeId] [int] NULL,
	[AuditPlanId] [int] NULL,
	[AuditFirmId] [int] NULL,
	[InitialDateNotice] [datetime] NULL,
	[InitialAuditAmount] [money] NULL,
	[InitialAuditDeadline] [datetime] NULL,
	[FinalDateNotice] [datetime] NULL,
	[FinalAuditNoticeDate] [datetime] NULL,
	[FinalAuditAmount] [money] NULL,
	[Notes] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](250) NOT NULL,
	[HistoricalNotes] [nvarchar](max) NULL,
	[MultipleStoreDiscount] [bit] NULL,
	[AmountBilledToPharmacy] [money] NULL,
	[BusinessLine] [nvarchar](50) NULL,
 CONSTRAINT [PK_PM_Audit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PM_Audit] ADD  CONSTRAINT [DF_PM_Audit_MultipleStoreDiscount]  DEFAULT ((0)) FOR [MultipleStoreDiscount]
GO
