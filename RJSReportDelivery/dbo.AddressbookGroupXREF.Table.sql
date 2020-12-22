USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[AddressbookGroupXREF]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressbookGroupXREF](
	[AddressID] [int] NULL,
	[AddressGroupID] [int] NULL,
	[DistRecipID] [int] NULL,
	[Type] [varchar](10) NULL
) ON [PRIMARY]
GO
