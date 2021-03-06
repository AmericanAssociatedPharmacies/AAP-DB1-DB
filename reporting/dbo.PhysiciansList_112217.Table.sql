USE [reporting]
GO
/****** Object:  Table [dbo].[PhysiciansList_112217]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhysiciansList_112217](
	[EMAIL] [nvarchar](255) NULL,
	[FIRST] [nvarchar](255) NULL,
	[LAST] [nvarchar](255) NULL,
	[COMPANY] [nvarchar](255) NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[ZIP] [nvarchar](255) NULL,
	[PHONE] [nvarchar](255) NULL,
	[JOBTITLE] [nvarchar](255) NULL,
	[MED_TYPE] [nvarchar](255) NULL,
	[GENDER] [nvarchar](255) NULL,
	[EMPLOYEES] [float] NULL
) ON [PRIMARY]
GO
