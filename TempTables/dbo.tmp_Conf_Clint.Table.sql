USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_Conf_Clint]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Conf_Clint](
	[Account] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Terr] [nvarchar](255) NULL,
	[AAPID] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[PVA Avg] [float] NULL,
	[Avg WHS Vol] [float] NULL,
	[AAP Elite] [nvarchar](255) NULL,
	[FullName] [nvarchar](255) NULL,
	[Conference2010] [nvarchar](255) NULL,
	[Conference2011] [nvarchar](255) NULL,
	[Conference2012] [nvarchar](255) NULL
) ON [PRIMARY]
GO
