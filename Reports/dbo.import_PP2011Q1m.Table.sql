USE [Reports]
GO
/****** Object:  Table [dbo].[import_PP2011Q1m]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_PP2011Q1m](
	[affiliate] [nvarchar](255) NULL,
	[aapaccountno] [nvarchar](255) NULL,
	[ncpdp] [nvarchar](255) NULL,
	[accountname] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[address2] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[state] [nvarchar](255) NULL,
	[zip] [nvarchar](255) NULL,
	[aapquitdate] [nvarchar](255) NULL,
	[volumeamt] [money] NULL,
	[rebateamt] [money] NULL,
	[pmid] [float] NULL,
	[aapparentno] [nvarchar](255) NULL,
	[LAST] [nvarchar](255) NULL
) ON [PRIMARY]
GO
