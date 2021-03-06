USE [WebDev]
GO
/****** Object:  Table [dbo].[StaffGuard_Names]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffGuard_Names](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[NameFirst] [varchar](255) NULL,
	[NameMI] [varchar](255) NULL,
	[NameLast] [varchar](255) NULL,
	[NameFull] [varchar](255) NULL,
	[dateAdded] [datetime] NULL,
	[dateModified] [datetime] NULL,
	[dateLastChecked] [datetime] NULL,
	[isMatchOIG] [int] NULL,
	[isMatchGSA] [int] NULL,
	[matchOIG] [varchar](255) NULL,
	[matchGSA] [varchar](255) NULL
) ON [PRIMARY]
GO
