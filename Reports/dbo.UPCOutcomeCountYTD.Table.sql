USE [Reports]
GO
/****** Object:  Table [dbo].[UPCOutcomeCountYTD]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPCOutcomeCountYTD](
	[Claim Volume] [varchar](255) NULL,
	[YTD Q2 2015 Quantity] [int] NULL,
	[YTD Q2 2015 % of Total] [float] NULL,
	[YTD Q2 2014 Quantity] [int] NULL,
	[YTD Q2 2014 % of Total] [float] NULL
) ON [PRIMARY]
GO
