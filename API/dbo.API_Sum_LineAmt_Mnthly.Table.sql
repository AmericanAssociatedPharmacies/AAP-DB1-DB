USE [API]
GO
/****** Object:  Table [dbo].[API_Sum_LineAmt_Mnthly]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_Sum_LineAmt_Mnthly](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[WHAccountID] [varchar](32) NOT NULL,
	[JANUARY] [numeric](18, 2) NULL,
	[FEBRUARY] [numeric](18, 2) NULL,
	[MARCH] [numeric](18, 2) NULL,
	[APRIL] [numeric](18, 2) NULL,
	[MAY] [numeric](18, 2) NULL,
	[JUNE] [numeric](18, 2) NULL,
	[JULY] [numeric](18, 2) NULL,
	[AUGUST] [numeric](18, 2) NULL,
	[SEPTEMBER] [numeric](18, 2) NULL,
	[OCTOBER] [numeric](18, 2) NULL,
	[NOVEMBER] [numeric](18, 2) NULL,
	[DECEMBER] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
