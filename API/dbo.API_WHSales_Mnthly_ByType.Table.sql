USE [API]
GO
/****** Object:  Table [dbo].[API_WHSales_Mnthly_ByType]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_WHSales_Mnthly_ByType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[WHAccountID] [varchar](32) NOT NULL,
	[JANUARY_OTC] [numeric](18, 2) NULL,
	[FEBRUARY_OTC] [numeric](18, 2) NULL,
	[MARCH_OTC] [numeric](18, 2) NULL,
	[APRIL_OTC] [numeric](18, 2) NULL,
	[MAY_OTC] [numeric](18, 2) NULL,
	[JUNE_OTC] [numeric](18, 2) NULL,
	[JULY_OTC] [numeric](18, 2) NULL,
	[AUGUST_OTC] [numeric](18, 2) NULL,
	[SEPTEMBER_OTC] [numeric](18, 2) NULL,
	[OCTOBER_OTC] [numeric](18, 2) NULL,
	[NOVEMBER_OTC] [numeric](18, 2) NULL,
	[DECEMBER_OTC] [numeric](18, 2) NULL,
	[JANUARY_BR] [numeric](18, 2) NULL,
	[FEBRUARY_BR] [numeric](18, 2) NULL,
	[MARCH_BR] [numeric](18, 2) NULL,
	[APRIL_BR] [numeric](18, 2) NULL,
	[MAY_BR] [numeric](18, 2) NULL,
	[JUNE_BR] [numeric](18, 2) NULL,
	[JULY_BR] [numeric](18, 2) NULL,
	[AUGUST_BR] [numeric](18, 2) NULL,
	[SEPTEMBER_BR] [numeric](18, 2) NULL,
	[OCTOBER_BR] [numeric](18, 2) NULL,
	[NOVEMBER_BR] [numeric](18, 2) NULL,
	[DECEMBER_BR] [numeric](18, 2) NULL,
	[JANUARY_GEN] [numeric](18, 2) NULL,
	[FEBRUARY_GEN] [numeric](18, 2) NULL,
	[MARCH_GEN] [numeric](18, 2) NULL,
	[APRIL_GEN] [numeric](18, 2) NULL,
	[MAY_GEN] [numeric](18, 2) NULL,
	[JUNE_GEN] [numeric](18, 2) NULL,
	[JULY_GEN] [numeric](18, 2) NULL,
	[AUGUST_GEN] [numeric](18, 2) NULL,
	[SEPTEMBER_GEN] [numeric](18, 2) NULL,
	[OCTOBER_GEN] [numeric](18, 2) NULL,
	[NOVEMBER_GEN] [numeric](18, 2) NULL,
	[DECEMBER_GEN] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
