USE [Reports]
GO
/****** Object:  Table [dbo].[import_planogram2013]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_planogram2013](
	[Account] [nvarchar](255) NULL,
	[Address1] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Terr] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[Subtype] [nvarchar](255) NULL,
	[Planogram] [nvarchar](255) NULL,
	[AAP Elite] [nvarchar](255) NULL,
	[FullName] [nvarchar](255) NULL,
	[AAP ID] [nvarchar](255) NULL,
	[API ID] [nvarchar](255) NULL,
	[2012 Rebate] [money] NULL,
	[PMID] [nvarchar](255) NULL,
	[Bs Cls] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[2013 Rebate] [money] NULL,
	[% Delta] [float] NULL
) ON [PRIMARY]
GO
