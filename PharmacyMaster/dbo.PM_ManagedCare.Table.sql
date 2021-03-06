USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_ManagedCare]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_ManagedCare](
	[PK_ManagedCare] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[MCEffectiveDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[ChainCode] [int] NULL,
	[ArgusAgree] [smallint] NULL,
	[MCNews_EmailAddress] [varchar](150) NULL,
	[emailMCNews] [smallint] NULL,
	[McQuitReasonInternal] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[ESI] [smallint] NULL,
 CONSTRAINT [PK_PM_ManagedCare] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PM_ManagedCare] ADD  CONSTRAINT [DF_PM_ManagedCare_emailMCNews]  DEFAULT ((0)) FOR [emailMCNews]
GO
ALTER TABLE [dbo].[PM_ManagedCare] ADD  CONSTRAINT [DF__PM_Manage__Creat__01DE32A8]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_ManagedCare] ADD  CONSTRAINT [DF__PM_Manage__Modif__02D256E1]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_ManagedCare] ADD  CONSTRAINT [DF__PM_Manage__RowVe__03C67B1A]  DEFAULT ((1)) FOR [RowVersion]
GO
