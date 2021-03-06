USE [TempTables]
GO
/****** Object:  Table [dbo].[HayesEx2_vpma]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesEx2_vpma](
	[pmid] [int] NOT NULL,
	[SName] [nvarchar](4000) NULL,
	[SCorporatename] [nvarchar](4000) NULL,
	[SAddress] [nvarchar](4000) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip5] [varchar](5) NULL,
	[SPhone] [nvarchar](4000) NULL,
	[accountdescription] [varchar](200) NULL,
	[aapaccountno] [varchar](20) NULL,
	[aapstatus] [varchar](32) NULL,
	[apiaccountno] [varchar](20) NULL,
	[apistatus] [varchar](32) NULL,
	[territory] [varchar](4) NULL
) ON [PRIMARY]
GO
