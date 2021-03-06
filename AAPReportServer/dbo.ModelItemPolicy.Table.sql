USE [AAPReportServer]
GO
/****** Object:  Table [dbo].[ModelItemPolicy]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModelItemPolicy](
	[ID] [uniqueidentifier] NOT NULL,
	[CatalogItemID] [uniqueidentifier] NOT NULL,
	[ModelItemID] [nvarchar](425) NOT NULL,
	[PolicyID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ModelItemPolicy] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModelItemPolicy]  WITH NOCHECK ADD  CONSTRAINT [FK_PoliciesPolicyID] FOREIGN KEY([PolicyID])
REFERENCES [dbo].[Policies] ([PolicyID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModelItemPolicy] CHECK CONSTRAINT [FK_PoliciesPolicyID]
GO
