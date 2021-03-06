USE [Reports]
GO
/****** Object:  Table [dbo].[import_Planogram2012Full]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_Planogram2012Full](
	[PMID] [int] NULL,
	[Account] [nvarchar](255) NULL,
	[Address1] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Terr] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[Subtype] [nvarchar](255) NULL,
	[Planogram] [nvarchar](255) NULL,
	[AAP ID] [nvarchar](255) NULL,
	[API ID] [nvarchar](255) NULL,
	[AAP Elite] [nvarchar](255) NULL,
	[FullName] [nvarchar](255) NULL,
	[2011 Rebate] [money] NULL,
	[2012 Rebate] [money] NULL,
	[i(d)] [float] NULL,
	[3M rebate] [money] NULL,
	[TL RB] [money] NULL,
	[TL% i(d)] [float] NULL
) ON [PRIMARY]
GO
