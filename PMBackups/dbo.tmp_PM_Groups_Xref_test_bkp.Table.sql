USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_PM_Groups_Xref_test_bkp]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PM_Groups_Xref_test_bkp](
	[Grpxref_ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[Source] [varchar](5) NULL
) ON [PRIMARY]
GO
