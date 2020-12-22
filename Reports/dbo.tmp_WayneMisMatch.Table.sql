USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_WayneMisMatch]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_WayneMisMatch](
	[Acct#] [varchar](50) NULL,
	[Pharmacy Name] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[ST] [varchar](255) NULL,
	[Status] [varchar](255) NULL,
	[FAX] [varchar](255) NULL,
	[Match] [varchar](255) NULL
) ON [PRIMARY]
GO
