USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_GR0510_mailmerge]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0510_mailmerge](
	[Vendor ID] [nvarchar](255) NULL,
	[Contact] [varchar](255) NULL,
	[Account Name] [varchar](65) NULL,
	[corporatename] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[month] [varchar](8) NOT NULL,
	[SourceSales] [money] NULL,
	[StoreRebate] [money] NULL,
	[AverageRebatePct] [money] NULL,
	[HRTA] [float] NULL,
	[aapid] [varchar](20) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
