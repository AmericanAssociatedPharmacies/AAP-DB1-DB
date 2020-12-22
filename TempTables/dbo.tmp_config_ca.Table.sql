USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_config_ca]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_config_ca](
	[id] [varchar](100) NULL,
	[directory] [varchar](100) NULL,
	[file] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[date] [varchar](20) NULL
) ON [PRIMARY]
GO
