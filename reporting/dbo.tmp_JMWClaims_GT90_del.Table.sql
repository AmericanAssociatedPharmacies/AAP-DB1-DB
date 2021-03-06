USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_JMWClaims_GT90_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_JMWClaims_GT90_del](
	[NABP] [nvarchar](50) NULL,
	[BIN] [nvarchar](50) NULL,
	[PCN] [nvarchar](50) NULL,
	[Group] [nvarchar](50) NULL,
	[NDC11] [nvarchar](50) NULL,
	[Drug Name] [nvarchar](150) NULL,
	[Strength] [nvarchar](50) NULL,
	[Brand Type] [nvarchar](50) NULL,
	[DAW] [nvarchar](50) NULL,
	[Column 5] [nvarchar](50) NULL,
	[Dot Nbr] [nvarchar](50) NULL,
	[Metrics] [nvarchar](50) NULL,
	[TRx Count] [int] NULL,
	[TRx Quantity Dispensed] [int] NULL,
	[Total  AWP] [numeric](28, 4) NULL,
	[Patient Paid Amount] [numeric](28, 4) NULL,
	[Total Paid Amount] [numeric](28, 4) NULL,
	[Dispensing Fee Amount] [numeric](28, 4) NULL,
	[Total Ingredient Cost] [numeric](28, 4) NULL,
	[Usual Customary Amount] [numeric](28, 4) NULL,
	[TotalWAC NDC] [numeric](28, 4) NULL,
	[TotalWAC GCN] [numeric](28, 4) NULL,
	[UDS] [numeric](28, 4) NULL,
	[GCN] [varchar](50) NULL,
	[UNIT PRICE BY NDC] [numeric](28, 4) NULL,
	[UNIT PRICE BY GCN] [numeric](28, 4) NULL,
	[RxNbr] [varchar](50) NULL
) ON [PRIMARY]
GO
