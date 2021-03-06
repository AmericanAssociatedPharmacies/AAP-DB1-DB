USE [AAP]
GO
/****** Object:  Table [dbo].[AdminFees_Sept_Dec2009]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminFees_Sept_Dec2009](
	[acct_no] [varchar](5) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[september] [numeric](38, 2) NULL,
	[october] [numeric](38, 2) NULL,
	[november] [numeric](38, 2) NULL,
	[december] [numeric](38, 2) NULL,
	[total] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
