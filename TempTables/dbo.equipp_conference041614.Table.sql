USE [TempTables]
GO
/****** Object:  Table [dbo].[equipp_conference041614]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipp_conference041614](
	[pmid] [int] NULL,
	[npi] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[affiliate] [varchar](125) NULL,
	[accountname] [varchar](65) NULL,
	[state] [varchar](2) NULL,
	[parent] [varchar](119) NULL
) ON [PRIMARY]
GO
