USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_HVRebate_mailmerge_JMW]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_HVRebate_mailmerge_JMW](
	[Vendor ID] [nvarchar](255) NULL,
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
	[High Volume Incentive] [numeric](18, 2) NULL,
	[AAP Brand RX Sales] [numeric](18, 2) NULL,
	[COG Reduction] [float] NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
