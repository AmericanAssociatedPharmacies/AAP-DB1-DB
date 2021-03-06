USE [reporting]
GO
/****** Object:  Table [dbo].[import_GR0510_Sales]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_GR0510_Sales](
	[PMID] [nvarchar](255) NULL,
	[AAP#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[Account Name] [varchar](65) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[territory] [varchar](4) NULL,
	[affiliate] [varchar](128) NULL,
	[SourceSales] [money] NULL,
	[Rebate] [money] NULL,
	[AverageRebatePct] [float] NULL,
	[HRTA] [float] NULL,
	[Mailed to address] [varchar](100) NULL,
	[f_address2] [varchar](100) NULL,
	[f_city] [varchar](50) NULL,
	[f_state] [varchar](2) NULL,
	[f_zip] [varchar](50) NULL,
	[Contact] [varchar](255) NULL
) ON [PRIMARY]
GO
