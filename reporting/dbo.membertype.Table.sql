USE [reporting]
GO
/****** Object:  Table [dbo].[membertype]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[membertype](
	[acct_no] [varchar](5) NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[primarywsname] [varchar](15) NULL
) ON [PRIMARY]
GO
