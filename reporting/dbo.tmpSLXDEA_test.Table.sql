USE [reporting]
GO
/****** Object:  Table [dbo].[tmpSLXDEA_test]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpSLXDEA_test](
	[accountID] [varchar](12) NULL,
	[ncpdp] [varchar](32) NULL,
	[city] [varchar](32) NULL,
	[state] [varchar](32) NULL,
	[territory] [varchar](32) NULL,
	[name] [varchar](128) NULL,
	[DEA] [varchar](15) NULL,
	[udacctno] [varchar](32) NULL
) ON [PRIMARY]
GO
