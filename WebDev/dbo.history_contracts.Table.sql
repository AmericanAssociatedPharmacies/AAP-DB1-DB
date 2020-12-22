USE [WebDev]
GO
/****** Object:  Table [dbo].[history_contracts]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history_contracts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Name] [varchar](255) NULL,
	[date] [datetime] NULL,
	[contract] [varchar](15) NOT NULL
) ON [PRIMARY]
GO
