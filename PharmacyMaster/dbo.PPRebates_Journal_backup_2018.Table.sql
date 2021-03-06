USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PPRebates_Journal_backup_2018]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPRebates_Journal_backup_2018](
	[Vendor ID] [int] NULL,
	[Invoice #] [varchar](6) NOT NULL,
	[Date] [varchar](9) NOT NULL,
	[Date Due] [varchar](8) NOT NULL,
	[Accounts Payable Account] [varchar](7) NOT NULL,
	[Number Of Distributions] [int] NOT NULL,
	[GL Account] [varchar](7) NOT NULL,
	[Amount] [numeric](8, 2) NULL,
	[Recur Number] [int] NOT NULL,
	[Recur Frequency] [int] NOT NULL
) ON [PRIMARY]
GO
