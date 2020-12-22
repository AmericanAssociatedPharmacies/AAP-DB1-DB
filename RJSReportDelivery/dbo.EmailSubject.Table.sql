USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[EmailSubject]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailSubject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SpoolName] [varchar](10) NOT NULL,
	[UserData] [varchar](10) NOT NULL,
	[Subject] [varchar](200) NOT NULL
) ON [PRIMARY]
GO
