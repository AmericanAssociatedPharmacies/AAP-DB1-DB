USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_FullNameSplit]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_FullNameSplit](
	[FullName] [varchar](200) NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL
) ON [PRIMARY]
GO
