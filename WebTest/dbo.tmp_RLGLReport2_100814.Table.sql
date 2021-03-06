USE [WebTest]
GO
/****** Object:  Table [dbo].[tmp_RLGLReport2_100814]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_RLGLReport2_100814](
	[UPC] [int] NOT NULL,
	[RLGL] [varchar](1) NOT NULL,
	[LossGross] [float] NULL,
	[LossNet] [float] NULL,
	[test] [varchar](4) NOT NULL,
	[APIGrossPerUnit] [numeric](18, 4) NULL,
	[APINetPerUnit] [numeric](21, 6) NULL,
	[CAHGrossPerUnit] [float] NULL,
	[CAHNetPerUnit] [float] NULL,
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
	[desi2] [int] NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[UpdatedOn] [datetime] NULL,
	[BB] [numeric](11, 5) NULL,
	[WHN] [numeric](11, 5) NULL
) ON [PRIMARY]
GO
