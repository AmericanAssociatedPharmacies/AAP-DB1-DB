USE [Reports]
GO
/****** Object:  Table [dbo].[import_PPartners_2Q2011]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_PPartners_2Q2011](
	[period] [nvarchar](255) NULL,
	[pmid] [float] NULL,
	[volumeamt] [float] NULL,
	[rebateamt] [float] NULL,
	[paymentamt] [float] NULL,
	[eligible] [float] NULL,
	[affiliate] [nvarchar](255) NULL,
	[Lastpayment] [float] NULL,
	[PAID TO STORE] [float] NULL,
	[PAID TO AFFILIATE] [float] NULL
) ON [PRIMARY]
GO
