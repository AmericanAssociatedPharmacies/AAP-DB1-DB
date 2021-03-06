USE [WebTest]
GO
/****** Object:  Table [dbo].[NetstoreUsers]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetstoreUsers](
	[ClientID] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Enabled] [nvarchar](50) NULL,
	[NABP] [nvarchar](50) NULL,
	[DEA#] [nvarchar](50) NULL,
	[PMID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
