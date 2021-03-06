USE [reporting]
GO
/****** Object:  Table [dbo].[CH_COGSAR_0608_src_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_COGSAR_0608_src_del](
	[Ship To Division] [nvarchar](50) NULL,
	[Ship To Division Name] [nvarchar](50) NULL,
	[Ship To Number] [nvarchar](50) NULL,
	[Ship To Name] [nvarchar](50) NULL,
	[Ship To Address 1] [nvarchar](50) NULL,
	[Ship To City] [nvarchar](50) NULL,
	[Ship To State] [nvarchar](50) NULL,
	[Ship To Postal Code] [nvarchar](50) NULL,
	[Store Number] [nvarchar](50) NULL,
	[Default Buy Plan % (COG's)] [nvarchar](50) NULL,
	[AR2000 Terms Code] [nvarchar](50) NULL,
	[Statement Frequency] [nvarchar](50) NULL
) ON [PRIMARY]
GO
