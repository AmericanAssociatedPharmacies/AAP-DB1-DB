USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_commercialAlerts_out]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_commercialAlerts_out](
	[id] [varchar](100) NULL,
	[type] [varchar](10) NULL,
	[file] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[date] [varchar](20) NULL,
	[directory] [varchar](100) NULL,
	[category] [varchar](100) NULL
) ON [PRIMARY]
GO
