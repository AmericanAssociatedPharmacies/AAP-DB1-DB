USE [Reports]
GO
/****** Object:  Table [dbo].[testPPRebates]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[testPPRebates](
	[PMID] [float] NULL,
	[VolumeAmt] [float] NULL,
	[RebateAmt] [float] NULL,
	[PaymentAmt] [float] NULL,
	[Eligible] [float] NULL,
	[Affiliate] [varchar](255) NULL,
	[LastPayment] [float] NULL,
	[PaidToStore] [float] NULL,
	[PaidToAffiliate] [float] NULL,
	[Period] [varchar](6) NULL
) ON [PRIMARY]
GO
