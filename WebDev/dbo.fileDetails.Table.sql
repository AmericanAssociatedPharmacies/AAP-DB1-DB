USE [WebDev]
GO
/****** Object:  Table [dbo].[fileDetails]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fileDetails](
	[id] [varchar](40) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[file] [varchar](255) NULL,
	[sort] [varchar](50) NULL,
	[accessRestriction] [varchar](50) NULL,
	[description] [varchar](255) NULL,
	[directory] [varchar](255) NULL,
	[date] [datetime] NULL,
	[category] [varchar](255) NULL,
	[deletedate] [datetime] NULL,
	[staledate] [datetime] NULL,
	[owner] [varchar](255) NULL,
	[url] [varchar](255) NULL
) ON [PRIMARY]
GO
