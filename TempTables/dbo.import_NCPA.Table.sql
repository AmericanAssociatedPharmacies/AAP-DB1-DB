USE [TempTables]
GO
/****** Object:  Table [dbo].[import_NCPA]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_NCPA](
	[PMID] [float] NULL,
	[NCPAid] [nvarchar](255) NULL,
	[Pharmacy] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](255) NULL
) ON [PRIMARY]
GO
