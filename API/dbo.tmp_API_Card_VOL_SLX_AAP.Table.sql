USE [API]
GO
/****** Object:  Table [dbo].[tmp_API_Card_VOL_SLX_AAP]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_Card_VOL_SLX_AAP](
	[dea] [varchar](50) NULL,
	[apiaccountno] [varchar](20) NULL,
	[tot_mo_1] [numeric](38, 2) NULL,
	[tot_mo_2] [numeric](38, 2) NULL,
	[tot_mo_3] [numeric](38, 2) NULL,
	[Avg_3_MO] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
