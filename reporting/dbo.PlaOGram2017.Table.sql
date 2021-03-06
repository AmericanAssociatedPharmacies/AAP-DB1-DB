USE [reporting]
GO
/****** Object:  Table [dbo].[PlaOGram2017]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaOGram2017](
	[2017] [nvarchar](255) NULL,
	[2016] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[Address1] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Terr] [float] NULL,
	[Type] [nvarchar](255) NULL,
	[Subtype] [nvarchar](255) NULL,
	[Planogram] [nvarchar](255) NULL,
	[AAP ID] [nvarchar](255) NULL,
	[API ID] [nvarchar](255) NULL,
	[AAP Elite] [nvarchar](255) NULL,
	[FullName] [nvarchar](255) NULL,
	[2016 Rebate] [money] NULL,
	[2016 Delta %] [float] NULL,
	[2017 Rebate] [money] NULL
) ON [PRIMARY]
GO
