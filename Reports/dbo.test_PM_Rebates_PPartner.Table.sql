USE [Reports]
GO
/****** Object:  Table [dbo].[test_PM_Rebates_PPartner]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_PM_Rebates_PPartner](
	[Period] [varchar](50) NULL,
	[PMID] [float] NULL,
	[VolumeAmt] [float] NULL,
	[RebateAmt] [float] NULL,
	[PaymentAmt] [float] NULL,
	[Eligible] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[LastPayment] [nvarchar](255) NULL,
	[Paid To Store] [float] NULL,
	[Paid To Affiliate] [float] NULL
) ON [PRIMARY]
GO
