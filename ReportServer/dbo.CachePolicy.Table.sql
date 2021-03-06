USE [ReportServer]
GO
/****** Object:  Table [dbo].[CachePolicy]    Script Date: 12/22/2020 5:04:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CachePolicy](
	[CachePolicyID] [uniqueidentifier] NOT NULL,
	[ReportID] [uniqueidentifier] NOT NULL,
	[ExpirationFlags] [int] NOT NULL,
	[CacheExpiration] [int] NULL,
 CONSTRAINT [PK_CachePolicy] PRIMARY KEY NONCLUSTERED 
(
	[CachePolicyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CachePolicy]  WITH NOCHECK ADD  CONSTRAINT [FK_CachePolicyReportID] FOREIGN KEY([ReportID])
REFERENCES [dbo].[Catalog] ([ItemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CachePolicy] CHECK CONSTRAINT [FK_CachePolicyReportID]
GO
