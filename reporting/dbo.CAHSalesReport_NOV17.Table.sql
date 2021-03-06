USE [reporting]
GO
/****** Object:  Table [dbo].[CAHSalesReport_NOV17]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAHSalesReport_NOV17](
	[November MSC] [float] NULL,
	[November Matrix] [nvarchar](255) NULL,
	[Customer] [float] NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Acct Class Code] [float] NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[DC Name] [nvarchar](255) NULL,
	[DC Number] [float] NULL,
	[Dea Number] [nvarchar](255) NULL,
	[Store] [nvarchar](255) NULL,
	[Sales - COG Applied] [money] NULL,
	[Net Sales] [money] NULL,
	[Total AAP Generics w /Excluded] [money] NULL,
	[IPA Source Sales] [nvarchar](255) NULL,
	[AAP Top Generics Source] [money] NULL,
	[AAP Source] [money] NULL,
	[Source Backup] [money] NULL,
	[CCA = 58705] [float] NULL,
	[AAP Excluded Generic Rx Prod] [nvarchar](255) NULL,
	[Non Rx Sales] [money] NULL,
	[RX Branded Sales] [float] NULL,
	[OTC Sales] [money] NULL,
	[Other Sales] [float] NULL,
	[RX Sales] [float] NULL,
	[Specially Priced Merchandise] [money] NULL,
	[RX Dropship Sales] [float] NULL,
	[RX Compliance Sales] [float] NULL
) ON [PRIMARY]
GO
