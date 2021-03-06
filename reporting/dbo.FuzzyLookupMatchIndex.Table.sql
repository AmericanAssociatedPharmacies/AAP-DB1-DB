USE [reporting]
GO
/****** Object:  Table [dbo].[FuzzyLookupMatchIndex]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuzzyLookupMatchIndex](
	[Token] [nvarchar](255) NULL,
	[ColumnNumber] [int] NULL,
	[TokenProp] [int] NULL,
	[BucketNumber] [timestamp] NOT NULL,
	[Freq] [int] NULL,
	[Rids] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
