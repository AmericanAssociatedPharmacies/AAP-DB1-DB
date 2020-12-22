USE [WebTest]
GO
/****** Object:  Table [dbo].[GMStoresAvg]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMStoresAvg](
	[NCPDP] [nchar](10) NULL,
	[GMPercent] [numeric](18, 2) NULL,
	[ClaimCount] [int] NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
