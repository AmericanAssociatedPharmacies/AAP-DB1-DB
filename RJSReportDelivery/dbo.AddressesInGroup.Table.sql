USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[AddressesInGroup]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressesInGroup](
	[AddressID] [int] NOT NULL,
	[AddressGroupID] [int] NOT NULL,
	[AddressInGroupActivate] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC,
	[AddressGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
