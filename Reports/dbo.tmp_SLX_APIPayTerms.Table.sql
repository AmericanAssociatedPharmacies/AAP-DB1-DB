USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_SLX_APIPayTerms]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SLX_APIPayTerms](
	[APIAccountNo] [varchar](255) NULL,
	[DEA] [varchar](255) NULL,
	[PayTerms] [varchar](255) NULL,
	[CreditLimit] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
