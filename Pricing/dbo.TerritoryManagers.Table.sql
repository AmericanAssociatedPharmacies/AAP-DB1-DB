USE [Pricing]
GO
/****** Object:  Table [dbo].[TerritoryManagers]    Script Date: 12/22/2020 4:51:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TerritoryManagers](
	[TerritoryManagerID] [int] NOT NULL,
	[TerritoryManagerName] [varchar](128) NOT NULL,
	[Active] [int] NOT NULL,
 CONSTRAINT [CPK_TerritoryManagers] PRIMARY KEY CLUSTERED 
(
	[TerritoryManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
