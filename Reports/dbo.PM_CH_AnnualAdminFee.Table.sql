USE [Reports]
GO
/****** Object:  Table [dbo].[PM_CH_AnnualAdminFee]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CH_AnnualAdminFee](
	[date] [varchar](10) NOT NULL,
	[extsales] [float] NULL,
	[pmid] [varchar](50) NULL
) ON [PRIMARY]
GO
