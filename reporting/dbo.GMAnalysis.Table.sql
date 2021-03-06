USE [reporting]
GO
/****** Object:  Table [dbo].[GMAnalysis]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMAnalysis](
	[AnalysisID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DataID] [int] NULL,
	[FileName] [nvarchar](200) NULL,
	[PriceFileDate] [datetime] NULL,
	[FDBDate] [datetime] NULL,
	[WholeSaler] [int] NULL,
	[Discount] [numeric](10, 2) NULL,
	[DispensingFee] [numeric](10, 2) NULL,
	[Fromdt] [datetime] NULL,
	[Todt] [datetime] NULL,
	[Stores] [int] NULL,
	[days] [int] NULL,
	[daytype] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_GMAnalysis] PRIMARY KEY CLUSTERED 
(
	[AnalysisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GMAnalysis] ADD  CONSTRAINT [DF_GMAnalysis_WholeSaler]  DEFAULT ((1)) FOR [WholeSaler]
GO
ALTER TABLE [dbo].[GMAnalysis] ADD  CONSTRAINT [DF_GMAnalysis_Stores]  DEFAULT ((0)) FOR [Stores]
GO
ALTER TABLE [dbo].[GMAnalysis] ADD  CONSTRAINT [DF_GMAnalysis_90days]  DEFAULT ((0)) FOR [days]
GO
ALTER TABLE [dbo].[GMAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_GMAnalysis_GMDataSource] FOREIGN KEY([DataID])
REFERENCES [dbo].[GMDataSource] ([DataID])
GO
ALTER TABLE [dbo].[GMAnalysis] CHECK CONSTRAINT [FK_GMAnalysis_GMDataSource]
GO
ALTER TABLE [dbo].[GMAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_GMAnalysis_WholeSaler] FOREIGN KEY([WholeSaler])
REFERENCES [dbo].[PriceFile_del] ([id])
GO
ALTER TABLE [dbo].[GMAnalysis] CHECK CONSTRAINT [FK_GMAnalysis_WholeSaler]
GO
