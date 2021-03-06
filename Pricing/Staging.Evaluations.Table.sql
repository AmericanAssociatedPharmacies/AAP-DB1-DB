USE [Pricing]
GO
/****** Object:  Table [Staging].[Evaluations]    Script Date: 12/22/2020 4:51:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[Evaluations](
	[EvaluationsID] [int] IDENTITY(1,1) NOT NULL,
	[Source] [varchar](12) NULL,
	[Group] [varchar](12) NULL,
	[For] [varchar](50) NULL,
	[DateSaved] [date] NULL,
	[ItemNbr] [varchar](12) NULL,
	[ItemDesc] [varchar](50) NULL,
	[Unit] [varchar](12) NULL,
	[Size] [numeric](10, 2) NULL,
	[Contract] [varchar](12) NULL,
	[Program] [varchar](12) NULL,
	[Qty] [int] NULL,
	[APIPrice] [money] NULL,
	[Store] [money] NULL,
	[AWP] [money] NULL,
	[Net] [money] NULL,
	[PercentDiff] [decimal](10, 2) NULL,
	[DollarDiff] [money] NULL,
	[LastUpdated] [date] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_Evaluations] PRIMARY KEY CLUSTERED 
(
	[EvaluationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[Evaluations] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
