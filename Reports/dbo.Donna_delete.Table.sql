USE [Reports]
GO
/****** Object:  Table [dbo].[Donna_delete]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donna_delete](
	[NDC11] [nvarchar](50) NULL,
	[Drug Name] [nvarchar](50) NULL,
	[Strength] [nvarchar](50) NULL,
	[Brand Type] [nvarchar](50) NULL,
	[DAW] [nvarchar](50) NULL,
	[Column 5] [nvarchar](50) NULL,
	[Dot Nbr] [nvarchar](50) NULL,
	[Metrics] [nvarchar](50) NULL,
	[TRx Count] [nvarchar](50) NULL,
	[TRx Quantity Dispensed] [nvarchar](50) NULL,
	[Total  AWP] [numeric](29, 0) NULL,
	[Patient Paid Amount] [numeric](29, 0) NULL,
	[Total Paid Amount] [numeric](29, 0) NULL,
	[Dispensing Fee Amount] [numeric](29, 0) NULL,
	[Total Ingredient Cost] [numeric](29, 0) NULL,
	[Usual Customary Amount] [numeric](29, 0) NULL
) ON [PRIMARY]
GO
