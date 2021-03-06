USE [Reports]
GO
/****** Object:  Table [dbo].[import_PPRebates]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_PPRebates](
	[Period] [varchar](50) NULL,
	[PMID] [float] NULL,
	[VolumeAmt] [float] NULL,
	[RebateAmt] [float] NULL,
	[PaymentAmt] [float] NULL,
	[Eligible] [float] NULL,
	[Affiliate] [varchar](255) NULL,
	[LastPayment] [float] NULL,
	[PaidToStore] [float] NULL,
	[PaidToAffiliate] [float] NULL
) ON [PRIMARY]
GO
