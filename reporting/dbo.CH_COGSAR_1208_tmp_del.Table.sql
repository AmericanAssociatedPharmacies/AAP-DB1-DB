USE [reporting]
GO
/****** Object:  Table [dbo].[CH_COGSAR_1208_tmp_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_COGSAR_1208_tmp_del](
	[Ship To Division] [float] NULL,
	[Ship To Number] [float] NULL,
	[Store Number] [float] NULL,
	[Ship To Name] [nvarchar](255) NULL,
	[Ship To City] [nvarchar](255) NULL,
	[Ship To State] [nvarchar](255) NULL,
	[COGS] [float] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[AR2000 Terms Code Description] [nvarchar](255) NULL,
	[Statement Frequency] [nvarchar](255) NULL
) ON [PRIMARY]
GO
