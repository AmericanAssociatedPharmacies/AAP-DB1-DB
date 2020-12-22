USE [reporting]
GO
/****** Object:  Table [dbo].[GMRNP2]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMRNP2](
	[NDC] [varchar](11) NOT NULL,
	[NPT_TYPE] [varchar](2) NOT NULL,
	[NPT_DATEC] [datetime] NOT NULL,
	[NPT_PRICEX] [numeric](11, 5) NULL
) ON [PRIMARY]
GO
