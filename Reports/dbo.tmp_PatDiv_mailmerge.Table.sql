USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PatDiv_mailmerge]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PatDiv_mailmerge](
	[Vendor ID] [int] NULL,
	[chaccountnoprimary] [varchar](50) NULL,
	[Contact] [varchar](255) NULL,
	[Account Name] [varchar](65) NULL,
	[Corporate Name] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[Total Patr Div] [numeric](18, 2) NULL,
	[month] [varchar](9) NOT NULL,
	[Patr Div Installment] [numeric](18, 2) NULL,
	[aapid] [varchar](20) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
