USE [reporting]
GO
/****** Object:  Table [dbo].[Cardinal Brand Report Nov2017]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cardinal Brand Report Nov2017](
	[Account #] [float] NULL,
	[Account Name] [nvarchar](255) NULL,
	[Generic Name] [nvarchar](255) NULL,
	[NDC] [float] NULL,
	[Strength] [nvarchar](255) NULL,
	[Form] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[Mfr] [nvarchar](255) NULL,
	[Month-Year] [datetime] NULL,
	[Unit Price ] [money] NULL,
	[Ship Qty] [float] NULL,
	[Purchase Dollars] [money] NULL
) ON [PRIMARY]
GO
