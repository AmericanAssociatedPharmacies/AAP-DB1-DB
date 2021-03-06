USE [WebTest]
GO
/****** Object:  Table [dbo].[test_SCAN_daily]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_SCAN_daily](
	[NCPDP] [nvarchar](255) NULL,
	[NPI] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Corporate Name] [nvarchar](255) NULL,
	[Patient ID] [nvarchar](255) NULL,
	[Patient Last Name] [nvarchar](255) NULL,
	[Patient First Name] [nvarchar](255) NULL,
	[DOB] [datetime] NULL,
	[Phone] [nvarchar](255) NULL,
	[Plan Name] [nvarchar](255) NULL,
	[CMS Contract ID] [nvarchar](255) NULL,
	[Date First Identified (1st Fill HRM for Patient)] [nvarchar](255) NULL,
	[Number of Fills HRM Drug 1 (active ingredient)] [float] NULL,
	[Drug 1 Name] [nvarchar](255) NULL,
	[Number of Fills HRM Drug 2 (active ingredient)] [float] NULL,
	[Drug 2 Name] [nvarchar](255) NULL,
	[Number of Fills HRM Drug 3 (active ingredient)] [float] NULL,
	[Drug 3 Name] [nvarchar](255) NULL,
	[Number of Fills HRM Drug 4 (active ingredient)] [float] NULL,
	[Drug 4 Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
