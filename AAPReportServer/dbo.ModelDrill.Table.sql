USE [AAPReportServer]
GO
/****** Object:  Table [dbo].[ModelDrill]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModelDrill](
	[ModelDrillID] [uniqueidentifier] NOT NULL,
	[ModelID] [uniqueidentifier] NOT NULL,
	[ReportID] [uniqueidentifier] NOT NULL,
	[ModelItemID] [nvarchar](425) NOT NULL,
	[Type] [tinyint] NOT NULL,
 CONSTRAINT [PK_ModelDrill] PRIMARY KEY NONCLUSTERED 
(
	[ModelDrillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModelDrill]  WITH NOCHECK ADD  CONSTRAINT [FK_ModelDrillModel] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Catalog] ([ItemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModelDrill] CHECK CONSTRAINT [FK_ModelDrillModel]
GO
ALTER TABLE [dbo].[ModelDrill]  WITH NOCHECK ADD  CONSTRAINT [FK_ModelDrillReport] FOREIGN KEY([ReportID])
REFERENCES [dbo].[Catalog] ([ItemID])
GO
ALTER TABLE [dbo].[ModelDrill] CHECK CONSTRAINT [FK_ModelDrillReport]
GO
