USE [Reports]
GO
/****** Object:  Table [dbo].[ v_UPAutoStatus2012YTD]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ v_UPAutoStatus2012YTD](
	[$ Volume] [varchar](255) NULL,
	[CurrYTD Total Claim $] [float] NULL,
	[CurrYTD % of Total] [float] NULL,
	[PrevYTD Total Claim $] [float] NULL,
	[PrevYTD % of Total] [float] NULL
) ON [PRIMARY]
GO
