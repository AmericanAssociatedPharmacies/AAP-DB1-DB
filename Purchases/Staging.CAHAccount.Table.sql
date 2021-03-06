USE [Purchases]
GO
/****** Object:  Table [Staging].[CAHAccount]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[CAHAccount](
	[PMID] [int] NULL,
	[CAHAccountNo] [nvarchar](250) NULL,
	[AAPEffectiveDate] [date] NULL,
	[AAPQuitDate] [date] NOT NULL,
	[AAPEffectiveDateKey] [int] NULL,
	[AAPQuitDateKey] [int] NULL,
	[CorrectedCAHAccountNo] [nvarchar](250) NULL,
	[AAPAccountNo] [nvarchar](100) NULL,
	[PreviousMemberPMID] [int] NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[CAHAccount] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
