USE [Pricing]
GO
/****** Object:  Table [dbo].[_MasterFile]    Script Date: 12/22/2020 4:51:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_MasterFile](
	[Date] [datetime] NULL,
	[Type] [nvarchar](255) NULL,
	[CIN] [float] NULL,
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[AAP Price] [money] NULL,
	[Supplier] [nvarchar](255) NULL,
	[Brand Name] [nvarchar](255) NULL,
	[Form] [nvarchar](255) NULL,
	[NDC/UPC] [float] NULL,
	[NDC11] [nvarchar](50) NULL,
	[DP#] [float] NULL,
	[UOM] [nvarchar](255) NULL,
	[Price Per Unit] [float] NULL,
	[GPI_ID] [nvarchar](255) NULL,
	[GCN] [nvarchar](255) NULL,
	[GCN SEQ] [float] NULL,
	[AWP] [money] NULL,
	[Color] [nvarchar](255) NULL,
	[Select] [nvarchar](50) NULL,
	[Quantity] [nvarchar](50) NULL,
	[Comp Price] [nvarchar](50) NULL,
	[Invoice#] [nvarchar](50) NULL,
	[Invoice date] [datetime] NULL,
	[AAP Ext] [nvarchar](50) NULL,
	[Comp Ext] [nvarchar](50) NULL,
	[Size diff] [nvarchar](50) NULL,
	[Comp NDC] [nvarchar](50) NULL,
	[Notes] [nvarchar](100) NULL
) ON [PRIMARY]
GO
