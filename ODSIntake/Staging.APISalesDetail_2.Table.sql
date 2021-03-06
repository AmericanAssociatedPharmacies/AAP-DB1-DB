USE [ODSIntake]
GO
/****** Object:  Table [Staging].[APISalesDetail_2]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APISalesDetail_2](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[InvNbr] [char](35) NOT NULL,
	[InvLine] [char](4) NOT NULL,
	[CustNbr] [char](35) NOT NULL,
	[Cust] [char](100) NOT NULL,
	[Item] [char](125) NOT NULL,
	[NDC] [char](50) NOT NULL,
	[Qty] [char](20) NOT NULL,
	[ItemAmt] [char](20) NOT NULL,
	[ItemGrp] [char](10) NOT NULL,
	[AcctGrp] [char](10) NOT NULL,
	[Slsman] [char](4) NOT NULL,
	[InvDate] [char](20) NOT NULL,
	[LineAmt] [char](20) NOT NULL,
	[ExtSales] [char](20) NOT NULL,
	[SalesOrd] [char](20) NOT NULL,
	[DISREBATE] [char](20) NOT NULL,
	[IDTYPP] [char](4) NOT NULL,
	[IDNSVA] [char](20) NOT NULL,
	[REBATE] [char](20) NOT NULL,
	[IDPAGR] [char](4) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[APISalesDetail_2] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
