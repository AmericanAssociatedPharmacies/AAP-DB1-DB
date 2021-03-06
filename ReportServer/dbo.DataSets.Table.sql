USE [ReportServer]
GO
/****** Object:  Table [dbo].[DataSets]    Script Date: 12/22/2020 5:04:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataSets](
	[ID] [uniqueidentifier] NOT NULL,
	[ItemID] [uniqueidentifier] NOT NULL,
	[LinkID] [uniqueidentifier] NULL,
	[Name] [nvarchar](260) NOT NULL,
 CONSTRAINT [PK_DataSet] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DataSets]  WITH NOCHECK ADD  CONSTRAINT [FK_DataSetItemID] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Catalog] ([ItemID])
GO
ALTER TABLE [dbo].[DataSets] CHECK CONSTRAINT [FK_DataSetItemID]
GO
ALTER TABLE [dbo].[DataSets]  WITH NOCHECK ADD  CONSTRAINT [FK_DataSetLinkID] FOREIGN KEY([LinkID])
REFERENCES [dbo].[Catalog] ([ItemID])
GO
ALTER TABLE [dbo].[DataSets] CHECK CONSTRAINT [FK_DataSetLinkID]
GO
