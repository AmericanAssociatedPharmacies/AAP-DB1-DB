USE [ODSIntake]
GO
/****** Object:  Table [Staging].[APISalesDetailReload]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APISalesDetailReload](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[InvNbr] [char](35) NULL,
	[InvLine] [char](4) NULL,
	[CustNbr] [char](35) NULL,
	[Cust] [char](100) NULL,
	[Item] [char](125) NULL,
	[NDC] [char](50) NULL,
	[Qty] [char](20) NULL,
	[ItemAmt] [char](20) NULL,
	[ItemGrp] [char](10) NULL,
	[AcctGrp] [char](10) NULL,
	[Slsman] [char](4) NULL,
	[InvDate] [char](20) NULL,
	[LineAmt] [char](20) NULL,
	[ExtSales] [char](20) NULL,
	[SalesOrd] [char](20) NULL,
	[DISREBATE] [char](20) NULL,
	[IDTYPP] [char](4) NULL,
	[IDNSVA] [char](20) NULL,
	[REBATE] [char](20) NULL,
	[IDPAGR] [char](4) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ItemNo] [varchar](25) NULL,
	[CarrierCode] [varchar](50) NULL,
	[WharehouseNum] [varchar](10) NULL,
	[CarrierDesc] [varchar](100) NULL,
	[CustomerRef] [varchar](100) NULL,
	[OrderType] [varchar](100) NULL,
 CONSTRAINT [CPK_Staging_APISalesDetailReload] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[APISalesDetailReload] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[APISalesDetailReload] ADD  DEFAULT ((0.00)) FOR [DiscountPercentage]
GO
