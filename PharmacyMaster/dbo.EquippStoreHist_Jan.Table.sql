USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[EquippStoreHist_Jan]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_Jan](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
