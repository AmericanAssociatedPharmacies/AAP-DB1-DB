USE [reporting]
GO
/****** Object:  Table [dbo].[PlanOGrams2016]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanOGrams2016](
	[2015] [nvarchar](255) NULL,
	[2016] [nvarchar](255) NULL,
	[Account] [nvarchar](255) NULL,
	[Address1] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Terr] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[Subtype] [nvarchar](255) NULL,
	[Planogram] [nvarchar](255) NULL,
	[AAP ID] [float] NULL,
	[API ID] [nvarchar](255) NULL,
	[AAP Elite] [nvarchar](255) NULL,
	[FullName] [nvarchar](255) NULL,
	[2016 Rebate] [money] NULL,
	[2016 Delta %] [float] NULL,
	[2015 Rebate] [money] NULL,
	[2014 Rebate] [money] NULL,
	[2015 Delta %] [float] NULL,
	[2013 Rebate] [money] NULL,
	[%Delta] [float] NULL,
	[2012 Rebate] [money] NULL,
	[% Delta] [float] NULL
) ON [PRIMARY]
GO
