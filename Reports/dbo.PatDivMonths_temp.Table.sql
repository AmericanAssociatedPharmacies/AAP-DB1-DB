USE [Reports]
GO
/****** Object:  Table [dbo].[PatDivMonths_temp]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatDivMonths_temp](
	[pmid] [int] NOT NULL,
	[months] [nvarchar](4000) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL
) ON [PRIMARY]
GO
