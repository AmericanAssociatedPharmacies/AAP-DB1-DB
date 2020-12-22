USE [API]
GO
/****** Object:  Table [dbo].[tmp_API_SLX_COMP_DEA]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_SLX_COMP_DEA](
	[DEA] [varchar](20) NULL,
	[WHAccountID] [varchar](50) NULL,
	[SLXVolume] [varchar](50) NULL,
	[SLXGeneric] [varchar](50) NULL,
	[SLXBrand] [varchar](50) NULL,
	[SLXOTC] [varchar](50) NULL
) ON [PRIMARY]
GO
