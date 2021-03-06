USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PPartner2011Q1_rollup]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPartner2011Q1_rollup](
	[pmid] [float] NULL,
	[volumeamt] [float] NULL,
	[rebateamt] [float] NULL,
	[paymentamt] [float] NULL,
	[eligible] [nvarchar](255) NULL,
	[affiliate] [nvarchar](255) NULL,
	[lastpayment] [nvarchar](255) NULL,
	[paid to store] [float] NULL,
	[paid to affiliate] [float] NULL
) ON [PRIMARY]
GO
