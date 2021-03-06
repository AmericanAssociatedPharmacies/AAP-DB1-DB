USE [webdocs]
GO
/****** Object:  Table [dbo].[dmExpireByTypeInLocation]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmExpireByTypeInLocation](
	[DocTypeKey] [char](36) NOT NULL,
	[FromLocation] [char](36) NOT NULL,
	[ExpirationDays] [int] NOT NULL,
	[TargetLocation] [char](36) NOT NULL
) ON [PRIMARY]
GO
