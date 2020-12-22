USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PPRebates_mailmerge_JMW]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPRebates_mailmerge_JMW](
	[Vendor ID] [int] NULL,
	[Cardinal Account Number] [varchar](50) NULL,
	[AAP Member Number] [varchar](20) NULL,
	[Pharmacy Name] [varchar](65) NULL,
	[Corporate Name] [varchar](100) NULL,
	[Contact] [varchar](255) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[month] [varchar](9) NOT NULL,
	[Paid To Store] [numeric](18, 2) NULL,
	[Volume Amount] [numeric](18, 2) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
