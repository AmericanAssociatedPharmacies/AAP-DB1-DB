USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_API_Finance_Mail]    Script Date: 12/22/2020 4:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_Finance_Mail](
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Contact] [varchar](255) NULL,
	[Addr1] [varchar](255) NULL,
	[Addr2] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Zip] [varchar](255) NULL
) ON [PRIMARY]
GO
