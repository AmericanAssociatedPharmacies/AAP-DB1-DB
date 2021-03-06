USE [Reports]
GO
/****** Object:  Table [dbo].[UPCOutcomeNDCCount]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPCOutcomeNDCCount](
	[NDC Volume] [varchar](255) NULL,
	[Q2 Quantity] [int] NULL,
	[Q2 % of Total] [float] NULL,
	[Q1 Quantity] [int] NULL,
	[Q1 % of Total] [float] NULL
) ON [PRIMARY]
GO
