USE [TempTables]
GO
/****** Object:  Table [dbo].[chreturns_MS]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chreturns_MS](
	[NDC] [varchar](11) NOT NULL,
	[DEA] [int] NOT NULL,
	[GPI] [varchar](14) NULL,
	[GPIDesc] [varchar](60) NULL,
	[TC_GPI] [varchar](10) NULL,
	[TC_GPI_Name] [varchar](60) NULL
) ON [PRIMARY]
GO
