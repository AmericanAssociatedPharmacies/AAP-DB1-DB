USE [reporting]
GO
/****** Object:  Table [dbo].[tmpSLXAPI]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpSLXAPI](
	[SLX_accountID] [varchar](12) NULL,
	[SLX_ncpdp] [varchar](32) NULL,
	[SLX_city] [varchar](32) NULL,
	[SLX_state] [varchar](32) NULL,
	[SLX_territory] [varchar](32) NULL,
	[SLX_name] [varchar](128) NULL,
	[SLX_DEA] [varchar](15) NULL,
	[SLX_udacctno] [varchar](32) NULL
) ON [PRIMARY]
GO
