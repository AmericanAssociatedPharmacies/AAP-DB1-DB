USE [reporting]
GO
/****** Object:  Table [dbo].[Rx30Load_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx30Load_del](
	[Pharm ID] [nvarchar](50) NULL,
	[BIN Nbr] [nvarchar](50) NULL,
	[PCN] [nvarchar](50) NULL,
	[Group Nbr] [nvarchar](50) NULL,
	[Submitted] [datetime] NULL,
	[Rx Date] [datetime] NULL,
	[Qty Dispensed] [numeric](38, 0) NULL,
	[Day Supply] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[Fee Submitted] [numeric](38, 3) NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Plan Amount] [numeric](38, 3) NULL,
	[Co Pay Amount] [numeric](38, 3) NULL,
	[U and C] [numeric](38, 3) NULL,
	[Total Price] [numeric](38, 3) NULL,
	[BS] [nvarchar](5) NULL,
	[BR] [nvarchar](5) NULL,
	[OI] [nvarchar](5) NULL,
	[DAW] [nvarchar](5) NULL,
	[DAW Desc] [nvarchar](50) NULL,
	[Patient Paid] [numeric](38, 3) NULL,
	[Gross Amt Due] [numeric](38, 3) NULL,
	[Bill Code] [nvarchar](10) NULL,
	[Rej Code] [nvarchar](10) NULL,
	[Message Response] [nvarchar](300) NULL,
	[Tx Response] [nvarchar](3) NULL,
	[Rx Nbr] [nvarchar](10) NULL,
	[RfNbr] [nvarchar](10) NULL,
	[PID_Q] [nvarchar](10) NULL,
	[PID] [nvarchar](50) NULL,
	[Doctor] [nvarchar](50) NULL,
	[RA] [nvarchar](10) NULL,
	[NDCWritten] [nvarchar](50) NULL
) ON [PRIMARY]
GO
