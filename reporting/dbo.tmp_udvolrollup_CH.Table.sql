USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_udvolrollup_CH]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_udvolrollup_CH](
	[pmid] [int] NULL,
	[aapaccountno] [varchar](20) NULL,
	[udaccountno] [varchar](20) NULL,
	[January] [numeric](38, 2) NULL,
	[February] [numeric](38, 2) NULL,
	[March] [numeric](38, 2) NULL,
	[April] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
