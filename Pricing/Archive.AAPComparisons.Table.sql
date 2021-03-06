USE [Pricing]
GO
/****** Object:  Table [Archive].[AAPComparisons]    Script Date: 12/22/2020 4:51:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[AAPComparisons](
	[AAPComparisonsID] [int] IDENTITY(1,1) NOT NULL,
	[CIN] [varchar](50) NULL,
	[brand] [varchar](50) NULL,
	[NDC] [varchar](50) NULL,
	[Descr] [varchar](250) NULL,
	[Size] [numeric](10, 2) NULL,
	[ShipQty] [int] NULL,
	[StorePrice] [money] NULL,
	[StoreExt] [money] NULL,
	[AAPPrice] [money] NULL,
	[AAPExt] [money] NULL,
	[Program] [varchar](50) NULL,
	[DiffStoreVsAAP] [money] NULL,
	[DateAppended] [datetime] NULL,
	[Group] [varchar](50) NULL,
	[Source] [varchar](50) NULL,
	[For] [varchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Archive_AAPComparisons] PRIMARY KEY CLUSTERED 
(
	[AAPComparisonsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Archive].[AAPComparisons] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
