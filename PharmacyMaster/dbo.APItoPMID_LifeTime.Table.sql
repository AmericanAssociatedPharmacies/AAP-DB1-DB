USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[APItoPMID_LifeTime]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APItoPMID_LifeTime](
	[APIAccountNo] [varchar](20) NULL,
	[PMID] [int] NOT NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NOT NULL,
	[DateOpened] [datetime] NULL,
	[FirstOrderDate] [datetime2](3) NULL,
	[API_PMID_EffectiveDate] [datetime2](3) NULL,
	[API_PMID_QuitDate] [datetime] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[LastOrderDate] [datetime2](3) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[APItoPMID_LifeTime] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
