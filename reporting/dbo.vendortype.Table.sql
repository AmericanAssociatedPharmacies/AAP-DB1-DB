USE [reporting]
GO
/****** Object:  Table [dbo].[vendortype]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendortype](
	[vendortypeid] [int] NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[comments] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
