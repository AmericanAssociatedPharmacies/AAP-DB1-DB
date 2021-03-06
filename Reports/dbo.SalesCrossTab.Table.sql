USE [Reports]
GO
/****** Object:  Table [dbo].[SalesCrossTab]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesCrossTab](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[YearDate] [smallint] NOT NULL,
	[SalesSource] [varchar](25) NOT NULL,
	[SalesType] [varchar](10) NOT NULL,
	[Jan] [money] NOT NULL,
	[Feb] [money] NOT NULL,
	[Mar] [money] NOT NULL,
	[Apr] [money] NOT NULL,
	[May] [money] NOT NULL,
	[Jun] [money] NOT NULL,
	[Jul] [money] NOT NULL,
	[Aug] [money] NOT NULL,
	[Sep] [money] NOT NULL,
	[Oct] [money] NOT NULL,
	[Nov] [money] NOT NULL,
	[Dec] [money] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
 CONSTRAINT [CPK_SalesCrossTab] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SalesCrossTab] ADD  DEFAULT ((0.00)) FOR [Jan]
GO
ALTER TABLE [dbo].[SalesCrossTab] ADD  DEFAULT ((0.00)) FOR [Feb]
GO
ALTER TABLE [dbo].[SalesCrossTab] ADD  DEFAULT ((0.00)) FOR [Mar]
GO
ALTER TABLE [dbo].[SalesCrossTab] ADD  DEFAULT ((0.00)) FOR [Apr]
GO
ALTER TABLE [dbo].[SalesCrossTab] ADD  DEFAULT ((0.00)) FOR [May]
GO
ALTER TABLE [dbo].[SalesCrossTab] ADD  DEFAULT ((0.00)) FOR [Jun]
GO
ALTER TABLE [dbo].[SalesCrossTab] ADD  DEFAULT ((0.00)) FOR [Jul]
GO
ALTER TABLE [dbo].[SalesCrossTab] ADD  DEFAULT ((0.00)) FOR [Aug]
GO
ALTER TABLE [dbo].[SalesCrossTab] ADD  DEFAULT ((0.00)) FOR [Sep]
GO
ALTER TABLE [dbo].[SalesCrossTab] ADD  DEFAULT ((0.00)) FOR [Oct]
GO
ALTER TABLE [dbo].[SalesCrossTab] ADD  DEFAULT ((0.00)) FOR [Nov]
GO
ALTER TABLE [dbo].[SalesCrossTab] ADD  DEFAULT ((0.00)) FOR [Dec]
GO
ALTER TABLE [dbo].[SalesCrossTab] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
