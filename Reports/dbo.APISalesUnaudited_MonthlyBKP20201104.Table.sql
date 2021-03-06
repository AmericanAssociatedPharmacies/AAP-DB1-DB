USE [Reports]
GO
/****** Object:  Table [dbo].[APISalesUnaudited_MonthlyBKP20201104]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesUnaudited_MonthlyBKP20201104](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [int] NOT NULL,
	[APIAccountNo] [varchar](15) NULL,
	[GenericSales] [money] NULL,
	[BrandSales] [money] NULL,
	[OTCSales] [money] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[GenericSalesTier1] [money] NOT NULL,
	[GenericSalesTier2] [money] NOT NULL,
	[RowUpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
