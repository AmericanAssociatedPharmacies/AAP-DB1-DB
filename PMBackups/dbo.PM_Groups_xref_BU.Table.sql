USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_Groups_xref_BU]    Script Date: 12/22/2020 4:47:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Groups_xref_BU](
	[Grpxref_ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[Source] [varchar](5) NULL
) ON [PRIMARY]
GO
