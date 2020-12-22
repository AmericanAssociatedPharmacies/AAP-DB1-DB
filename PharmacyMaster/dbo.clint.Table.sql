USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[clint]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clint](
	[Customer] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[PMID] [nvarchar](255) NULL,
	[Amount] [money] NULL
) ON [PRIMARY]
GO
