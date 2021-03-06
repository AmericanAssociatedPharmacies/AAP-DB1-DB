USE [reporting]
GO
/****** Object:  Table [dbo].[united_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[united_del](
	[Pharm ID] [nvarchar](50) NULL,
	[BIN Nbr] [nvarchar](50) NULL,
	[PCN] [nvarchar](50) NULL,
	[Group Nbr] [nvarchar](50) NULL,
	[Submitted] [nvarchar](50) NULL,
	[Rx Date] [nvarchar](50) NULL,
	[Qty Dispensed] [numeric](38, 3) NULL,
	[Day Supply] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[Fee Submitted] [numeric](38, 2) NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Plan Amount] [numeric](38, 3) NULL,
	[Co Pay Amount] [numeric](38, 3) NULL,
	[U and C] [numeric](38, 3) NULL,
	[Total Price] [numeric](38, 3) NULL,
	[B] [nvarchar](50) NULL,
	[OI] [nvarchar](50) NULL,
	[AWP] [numeric](38, 5) NULL,
	[Discount] [numeric](38, 3) NULL
) ON [PRIMARY]
GO
