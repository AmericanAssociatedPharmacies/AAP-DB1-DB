USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[iFormsServers]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iFormsServers](
	[iFormsServerID] [int] IDENTITY(1,1) NOT NULL,
	[iFormsServerDescription] [varchar](50) NOT NULL,
	[iFormsServerURL] [varchar](50) NOT NULL,
	[iFormsServerUser] [varchar](50) NOT NULL,
	[iFormsServerPassword] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
