USE [Reports]
GO
/****** Object:  Table [dbo].[UPCOutcomeCountYTD_bkp]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPCOutcomeCountYTD_bkp](
	[Claim Volume] [varchar](255) NULL,
	[YTD Q2 2013 Quantity] [int] NULL,
	[YTD Q2 2013 % of Total] [float] NULL,
	[YTD Q2 2012 Quantity] [int] NULL,
	[YTD Q2 2012 % of Total] [float] NULL
) ON [PRIMARY]
GO
