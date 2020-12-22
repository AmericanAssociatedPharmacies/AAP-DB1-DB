USE [API]
GO
/****** Object:  Table [dbo].[TerritoryGroup]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TerritoryGroup](
	[ID] [varchar](5) NULL,
	[TerritoryGroup] [varchar](25) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TerritoryGroup] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
