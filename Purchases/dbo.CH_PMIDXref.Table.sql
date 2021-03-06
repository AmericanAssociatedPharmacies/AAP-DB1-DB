USE [Purchases]
GO
/****** Object:  Table [dbo].[CH_PMIDXref]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_PMIDXref](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [int] NULL,
	[IsResearched] [smallint] NULL,
	[AccountName] [varchar](255) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[address] [varchar](200) NULL,
	[city] [varchar](200) NULL,
	[state] [varchar](200) NULL,
	[zip] [varchar](50) NULL,
 CONSTRAINT [pk_id] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CH_PMIDXref] ADD  CONSTRAINT [DF_CH_PMIDXref_IsResearched]  DEFAULT ((0)) FOR [IsResearched]
GO
