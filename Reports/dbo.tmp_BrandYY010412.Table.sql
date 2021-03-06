USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_BrandYY010412]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_BrandYY010412](
	[period] [varchar](6) NOT NULL,
	[pmid] [int] NULL,
	[API_All] [float] NULL,
	[API_Brand] [float] NULL,
	[API_Generic] [float] NULL,
	[CH_All] [float] NULL,
	[CH_Brand] [float] NULL,
	[CH_Generic] [float] NULL,
	[Total_All] [float] NULL,
	[Total_Brand] [float] NULL,
	[Total_Generic] [float] NULL,
	[Pct_Brand] [float] NULL,
	[Pct_Generic] [float] NULL
) ON [PRIMARY]
GO
