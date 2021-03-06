USE [Purchases]
GO
/****** Object:  Table [dbo].[20200519]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[20200519](
	[PMID] [int] NULL,
	[CAHAccountNo] [nvarchar](250) NULL,
	[AAPEffectiveDate] [date] NULL,
	[AAPQuitDate] [date] NOT NULL,
	[AAPEffectiveDateKey] [int] NULL,
	[AAPQuitDateKey] [int] NULL,
	[CorrectedCAHAccountNo] [nvarchar](250) NULL,
	[AAPAccountNo] [nvarchar](100) NULL,
	[PreviousMemberPMID] [int] NULL,
	[IsPVA] [bit] NULL
) ON [PRIMARY]
GO
