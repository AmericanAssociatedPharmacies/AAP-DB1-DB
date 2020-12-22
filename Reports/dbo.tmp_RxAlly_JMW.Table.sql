USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_RxAlly_JMW]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_RxAlly_JMW](
	[First Name] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone No#] [float] NULL,
	[Fax No#] [float] NULL,
	[Company] [nvarchar](255) NULL,
	[NCPDP ID] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL
) ON [PRIMARY]
GO
