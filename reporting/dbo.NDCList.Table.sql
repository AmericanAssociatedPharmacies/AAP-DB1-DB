USE [reporting]
GO
/****** Object:  Table [dbo].[NDCList]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NDCList](
	[Store] [nvarchar](255) NULL,
	[NDC #] [nvarchar](255) NULL,
	[UPC #] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[SumOfQuantity] [float] NULL
) ON [PRIMARY]
GO
