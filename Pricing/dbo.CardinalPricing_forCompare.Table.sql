USE [Pricing]
GO
/****** Object:  Table [dbo].[CardinalPricing_forCompare]    Script Date: 12/22/2020 4:51:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardinalPricing_forCompare](
	[Date] [date] NULL,
	[Type] [varchar](15) NULL,
	[CIN] [float] NULL,
	[DESCRIPTION] [varchar](255) NULL,
	[SIZE] [varchar](50) NULL,
	[AAP Price] [decimal](18, 2) NULL,
	[Supplier] [varchar](50) NULL,
	[Brand Name] [varchar](50) NULL,
	[Form] [varchar](100) NULL,
	[NDC/UPC] [varchar](15) NULL,
	[GPI_ID] [varchar](25) NULL,
	[AWP] [float] NULL,
	[Select] [varchar](10) NULL,
	[Quantity] [int] NULL,
	[Comp Price] [varchar](50) NULL,
	[Invoice#] [varchar](50) NULL,
	[Invoice date] [datetime] NULL,
	[AAP Ext] [varchar](50) NULL,
	[Comp Ext] [varchar](50) NULL,
	[Size diff] [varchar](50) NULL,
	[Comp NDC] [varchar](50) NULL,
	[Notes] [varchar](255) NULL,
	[EntryID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CardinalPricing_forCompare] PRIMARY KEY CLUSTERED 
(
	[EntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
