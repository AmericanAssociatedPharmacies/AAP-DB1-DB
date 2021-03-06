USE [Reports]
GO
/****** Object:  Table [Staging].[Sales]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[Sales](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[CreditDate] [datetime] NULL,
	[APIBrandSales] [money] NULL,
	[APIGenericSales] [money] NULL,
	[APIOTCSales] [money] NULL,
	[MonthDate] [tinyint] NULL,
	[RowCreateDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_Rebates] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[Sales] ADD  DEFAULT (getdate()) FOR [RowCreateDate]
GO
