USE [Reports]
GO
/****** Object:  Table [dbo].[UPCOutcomeCount]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPCOutcomeCount](
	[Claim Volume] [varchar](255) NULL,
	[Q2 2015 Quantity] [int] NULL,
	[Q2 2015 % of Total] [float] NULL,
	[Q1 2015 Quantity] [int] NULL,
	[Q1 2015 % of Total] [float] NULL
) ON [PRIMARY]
GO
