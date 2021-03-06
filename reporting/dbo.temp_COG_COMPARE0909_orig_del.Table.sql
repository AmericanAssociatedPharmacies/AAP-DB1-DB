USE [reporting]
GO
/****** Object:  Table [dbo].[temp_COG_COMPARE0909_orig_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_COG_COMPARE0909_orig_del](
	[AFF] [float] NULL,
	[AFF Name] [nvarchar](255) NULL,
	[Div] [float] NULL,
	[Cust] [float] NULL,
	[Ship To Name] [nvarchar](255) NULL,
	[Ship To Address 1] [nvarchar](255) NULL,
	[Ship To City] [nvarchar](255) NULL,
	[Ship To State] [nvarchar](255) NULL,
	[Ship To Postal Code] [float] NULL,
	[Store Number] [float] NULL,
	[COG Buy Plan %] [float] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[Statement Frequency] [nvarchar](255) NULL,
	[Total Sales Extended Sales] [money] NULL,
	[Total RX] [money] NULL,
	[RX Generic] [money] NULL,
	[RX Brand] [money] NULL,
	[Total Generic Sales] [money] NULL,
	[Source Generics] [money] NULL,
	[OTC Cog Applied] [money] NULL
) ON [PRIMARY]
GO
