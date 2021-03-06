USE [WebTest]
GO
/****** Object:  Table [dbo].[Rx30Latest]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx30Latest](
	[Pharm ID] [nvarchar](50) NULL,
	[BIN Nbr] [nvarchar](50) NULL,
	[Group Nbr] [nvarchar](50) NULL,
	[Submitted] [datetime] NULL,
	[Rx Date] [datetime] NULL,
	[Qty Dispensed] [numeric](38, 3) NULL,
	[Day Supply] [int] NULL,
	[NDC] [nvarchar](50) NULL,
	[Fee Submitted] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Total Price] [numeric](38, 3) NULL,
	[Tx Response] [nvarchar](50) NULL,
	[Rx Nbr] [nvarchar](50) NULL,
	[RfNbr] [int] NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[UpdatedOn] [datetime] NULL,
	[PatID] [nvarchar](50) NULL,
	[RA] [int] NULL,
	[U and C] [numeric](38, 3) NULL,
	[RxID] [int] NOT NULL
) ON [PRIMARY]
GO
