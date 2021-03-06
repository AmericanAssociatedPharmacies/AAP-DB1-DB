USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_API2011Q2_mailmerge_PFOA]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API2011Q2_mailmerge_PFOA](
	[Vendor ID] [nvarchar](255) NULL,
	[Contact] [varchar](255) NULL,
	[Account Name] [varchar](65) NULL,
	[Corporate Name] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[month] [varchar](7) NOT NULL,
	[API Acct#] [nvarchar](255) NULL,
	[WarehouseSales] [money] NULL,
	[Avg Rebate Percentage] [float] NULL,
	[StoreRebate] [money] NULL,
	[aapid] [varchar](20) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
