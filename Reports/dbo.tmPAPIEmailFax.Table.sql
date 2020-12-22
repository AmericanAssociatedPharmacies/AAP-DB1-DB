USE [Reports]
GO
/****** Object:  Table [dbo].[tmPAPIEmailFax]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmPAPIEmailFax](
	[Acct#] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[FAX] [nvarchar](255) NULL
) ON [PRIMARY]
GO
