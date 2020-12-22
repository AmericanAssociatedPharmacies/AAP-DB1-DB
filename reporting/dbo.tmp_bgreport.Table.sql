USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_bgreport]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_bgreport](
	[pmid] [int] NULL,
	[aapaccountno] [varchar](20) NULL,
	[udaccountno] [varchar](20) NULL,
	[February_CHUD] [numeric](38, 2) NULL,
	[March_CHUD] [numeric](38, 2) NULL,
	[April_CHUD] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
