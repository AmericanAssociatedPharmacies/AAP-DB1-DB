USE [reporting]
GO
/****** Object:  Table [dbo].[vendormasterchild]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendormasterchild](
	[vendormasterid] [int] NOT NULL,
	[vendorchildid] [int] NOT NULL,
	[active] [bit] NOT NULL
) ON [PRIMARY]
GO
