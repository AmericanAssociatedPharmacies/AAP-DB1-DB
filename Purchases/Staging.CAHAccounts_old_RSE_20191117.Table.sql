USE [Purchases]
GO
/****** Object:  Table [Staging].[CAHAccounts_old_RSE_20191117]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[CAHAccounts_old_RSE_20191117](
	[PMID] [int] NULL,
	[CAHAccountPrimary] [nvarchar](100) NULL,
	[CAHAccount2] [nvarchar](100) NULL,
	[CAHAccount3] [nvarchar](100) NULL,
	[CAHCSOSAccount] [nvarchar](100) NULL,
	[CAHPOSAccount] [nvarchar](100) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[CAHSpecialtyAccount] [nvarchar](100) NULL,
	[CAHOTCAccount] [nvarchar](100) NULL,
	[CAHDMEAccount] [nvarchar](100) NULL,
	[CAHDepositAccount] [nvarchar](100) NULL,
	[CAHScanTossAccount] [nvarchar](250) NULL,
	[APIAccountNo] [nvarchar](100) NULL,
	[AAPStartDate] [date] NULL,
	[AAPEndDate] [date] NULL,
	[CAHComboAccount] [nvarchar](100) NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[CAHAccounts_old_RSE_20191117] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
