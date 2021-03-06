USE [Pricing]
GO
/****** Object:  Table [Staging].[ElectronicComparisons]    Script Date: 12/22/2020 4:51:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[ElectronicComparisons](
	[ElectronicComparisonsID] [int] IDENTITY(1,1) NOT NULL,
	[NDC] [varchar](50) NULL,
	[Program] [varchar](50) NULL,
	[Descr] [varchar](50) NULL,
	[API#] [varchar](50) NULL,
	[Desc] [varchar](250) NULL,
	[Size] [numeric](10, 2) NULL,
	[ShipQTY] [numeric](10, 2) NULL,
	[APIPrice] [money] NULL,
	[APIExt] [money] NULL,
	[StorePrice] [money] NULL,
	[StoreExt] [money] NULL,
	[AdjReb] [money] NULL,
	[AdjExt] [money] NULL,
	[Diff] [money] NULL,
	[ItemStat] [varchar](50) NULL,
	[For] [varchar](50) NULL,
	[DateAppended] [datetime] NULL,
	[Source] [varchar](50) NULL,
	[Group] [varchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_ElectronicComparisons] PRIMARY KEY CLUSTERED 
(
	[ElectronicComparisonsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[ElectronicComparisons] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
