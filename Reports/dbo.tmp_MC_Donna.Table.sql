USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_MC_Donna]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MC_Donna](
	[ChainCode] [varchar](50) NULL,
	[State] [varchar](255) NULL,
	[Name] [varchar](255) NULL,
	[AAPAccountNo] [varchar](255) NULL,
	[PMID] [numeric](18, 0) NULL,
	[AAPParentNo] [nvarchar](255) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[MCEffectiveDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL
) ON [PRIMARY]
GO
