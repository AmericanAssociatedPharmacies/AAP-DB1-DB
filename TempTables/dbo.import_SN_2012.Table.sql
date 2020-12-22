USE [TempTables]
GO
/****** Object:  Table [dbo].[import_SN_2012]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_SN_2012](
	[Item Number] [nvarchar](255) NULL,
	[Desc] [nvarchar](255) NULL,
	[NDC] [float] NULL,
	[Price] [float] NULL,
	[Usage] [nvarchar](255) NULL,
	[Ext# cost] [money] NULL
) ON [PRIMARY]
GO
