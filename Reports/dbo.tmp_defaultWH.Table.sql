USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_defaultWH]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_defaultWH](
	[AccountName] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](255) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[WHOrderCutoff] [varchar](255) NULL
) ON [PRIMARY]
GO
