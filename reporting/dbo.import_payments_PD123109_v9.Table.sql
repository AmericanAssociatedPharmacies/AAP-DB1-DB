USE [reporting]
GO
/****** Object:  Table [dbo].[import_payments_PD123109_v9]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_payments_PD123109_v9](
	[pmid] [nvarchar](255) NULL,
	[aap#] [nvarchar](255) NULL,
	[aapparentno] [varchar](20) NULL,
	[api#] [nvarchar](255) NULL,
	[ud #] [nvarchar](255) NULL,
	[accountname] [varchar](65) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[fax] [varchar](50) NULL,
	[territory] [varchar](4) NULL,
	[affiliate] [varchar](125) NULL,
	[TotalContributionAll] [float] NULL,
	[PDividend] [float] NULL,
	[CorporateName] [varchar](100) NULL,
	[FedTaxID] [varchar](12) NULL,
	[f_address] [varchar](100) NULL,
	[f_address2] [varchar](100) NULL,
	[f_city] [varchar](50) NULL,
	[f_state] [varchar](2) NULL,
	[f_zip] [varchar](50) NULL,
	[contactfullname] [varchar](255) NULL,
	[email] [varchar](80) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
