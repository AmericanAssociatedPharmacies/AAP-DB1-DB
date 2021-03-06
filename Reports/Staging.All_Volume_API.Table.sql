USE [Reports]
GO
/****** Object:  Table [Staging].[All_Volume_API]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[All_Volume_API](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[PharmacyName] [varchar](100) NULL,
	[APIAccountNo] [varchar](25) NULL,
	[APIEffectiveDate] [datetime] NULL,
	[APIQuitDate] [datetime] NULL,
	[DEA] [varchar](25) NULL,
	[APIStatusName] [varchar](25) NULL,
	[Date] [date] NULL,
	[Type] [varchar](10) NULL,
	[Qty] [decimal](18, 2) NOT NULL,
	[ExtSales] [money] NOT NULL,
	[RowCreatdDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[All_Volume_API] ADD  DEFAULT ((0.00)) FOR [Qty]
GO
ALTER TABLE [Staging].[All_Volume_API] ADD  DEFAULT ((0.00)) FOR [ExtSales]
GO
ALTER TABLE [Staging].[All_Volume_API] ADD  DEFAULT (getdate()) FOR [RowCreatdDate]
GO
