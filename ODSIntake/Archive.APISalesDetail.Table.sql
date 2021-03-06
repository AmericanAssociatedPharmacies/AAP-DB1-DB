USE [ODSIntake]
GO
/****** Object:  Table [Archive].[APISalesDetail]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[APISalesDetail](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[InvNbr] [char](35) NULL,
	[InvLine] [varchar](4) NULL,
	[CustNbr] [varchar](35) NULL,
	[Cust] [varchar](100) NULL,
	[Item] [varchar](100) NULL,
	[NDC] [varchar](100) NULL,
	[Qty] [varchar](100) NULL,
	[ItemAmt] [varchar](100) NULL,
	[ItemGrp] [varchar](100) NULL,
	[AcctGrp] [varchar](100) NULL,
	[Slsman] [varchar](100) NULL,
	[InvDate] [varchar](100) NULL,
	[LineAmt] [varchar](100) NULL,
	[ExtSales] [varchar](100) NULL,
	[SalesOrd] [varchar](100) NULL,
	[DISREBATE] [varchar](100) NULL,
	[IDTYPP] [varchar](100) NULL,
	[IDNSVA] [varchar](100) NULL,
	[REBATE] [varchar](100) NULL,
	[IDPAGR] [varchar](100) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ItemNo] [varchar](25) NULL,
	[CarrierCode] [varchar](50) NULL,
	[WharehouseNum] [varchar](10) NULL,
	[CarrierDesc] [varchar](100) NULL,
	[CustomerRef] [varchar](100) NULL,
	[OrderType] [varchar](100) NULL,
 CONSTRAINT [CPK_Archive_APISalesDetail] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Archive].[APISalesDetail] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Archive].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [DiscountPercentage]
GO
