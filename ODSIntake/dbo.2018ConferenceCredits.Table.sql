USE [ODSIntake]
GO
/****** Object:  Table [dbo].[2018ConferenceCredits]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[2018ConferenceCredits](
	[Territory] [nvarchar](255) NULL,
	[PMID] [float] NULL,
	[API #] [nvarchar](255) NULL,
	[Group #] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[API Status] [nvarchar](255) NULL,
	[Conference 2018] [nvarchar](255) NULL,
	[API Credit] [nvarchar](255) NULL
) ON [PRIMARY]
GO
