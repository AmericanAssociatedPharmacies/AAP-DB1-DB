USE [Reports]
GO
/****** Object:  Table [Staging].[SalesPivotAuditedUnaudited]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SalesPivotAuditedUnaudited](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[APIAccountNo] [varchar](15) NOT NULL,
	[Year] [tinyint] NOT NULL,
	[SalesType] [varchar](25) NOT NULL,
	[Source] [varchar](25) NOT NULL,
	[January] [money] NOT NULL,
	[February] [money] NOT NULL,
	[March] [money] NOT NULL,
	[April] [money] NOT NULL,
	[May] [money] NOT NULL,
	[June] [money] NOT NULL,
	[July] [money] NOT NULL,
	[August] [money] NOT NULL,
	[Septmember] [money] NOT NULL,
	[October] [money] NOT NULL,
	[November] [money] NOT NULL,
	[December] [money] NOT NULL,
	[Annual] [money] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_SalesPivotAuditedUnaudited] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[SalesPivotAuditedUnaudited] ADD  DEFAULT ((0.00)) FOR [January]
GO
ALTER TABLE [Staging].[SalesPivotAuditedUnaudited] ADD  DEFAULT ((0.00)) FOR [February]
GO
ALTER TABLE [Staging].[SalesPivotAuditedUnaudited] ADD  DEFAULT ((0.00)) FOR [March]
GO
ALTER TABLE [Staging].[SalesPivotAuditedUnaudited] ADD  DEFAULT ((0.00)) FOR [April]
GO
ALTER TABLE [Staging].[SalesPivotAuditedUnaudited] ADD  DEFAULT ((0.00)) FOR [May]
GO
ALTER TABLE [Staging].[SalesPivotAuditedUnaudited] ADD  DEFAULT ((0.00)) FOR [June]
GO
ALTER TABLE [Staging].[SalesPivotAuditedUnaudited] ADD  DEFAULT ((0.00)) FOR [July]
GO
ALTER TABLE [Staging].[SalesPivotAuditedUnaudited] ADD  DEFAULT ((0.00)) FOR [August]
GO
ALTER TABLE [Staging].[SalesPivotAuditedUnaudited] ADD  DEFAULT ((0.00)) FOR [Septmember]
GO
ALTER TABLE [Staging].[SalesPivotAuditedUnaudited] ADD  DEFAULT ((0.00)) FOR [October]
GO
ALTER TABLE [Staging].[SalesPivotAuditedUnaudited] ADD  DEFAULT ((0.00)) FOR [November]
GO
ALTER TABLE [Staging].[SalesPivotAuditedUnaudited] ADD  DEFAULT ((0.00)) FOR [December]
GO
ALTER TABLE [Staging].[SalesPivotAuditedUnaudited] ADD  DEFAULT ((0.00)) FOR [Annual]
GO
ALTER TABLE [Staging].[SalesPivotAuditedUnaudited] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
