USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_APIPayMethod]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_APIPayMethod](
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[APIStatus] [varchar](255) NULL,
	[PayTerms] [varchar](255) NULL,
	[CreditLimit] [money] NULL,
	[SeqNo] [float] NULL,
	[PaymentMethod] [varchar](50) NULL
) ON [PRIMARY]
GO
