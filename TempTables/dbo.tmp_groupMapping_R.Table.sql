USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_groupMapping_R]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_groupMapping_R](
	[PMID] [int] NOT NULL,
	[AccountName] [varchar](65) NULL,
	[APIGroupName] [varchar](125) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPGroupName] [varchar](50) NULL,
	[AAPID] [bigint] NULL,
	[affiliation] [nvarchar](255) NULL
) ON [PRIMARY]
GO
