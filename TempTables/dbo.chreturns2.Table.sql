USE [TempTables]
GO
/****** Object:  Table [dbo].[chreturns2]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chreturns2](
	[NDC] [varchar](11) NOT NULL,
	[DEA] [int] NOT NULL,
	[GPI] [varchar](14) NULL,
	[GPIDesc] [varchar](60) NULL
) ON [PRIMARY]
GO
