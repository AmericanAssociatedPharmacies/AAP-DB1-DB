USE [API]
GO
/****** Object:  Table [dbo].[tmp_july_otc_betty]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_july_otc_betty](
	[Cust#] [nvarchar](255) NULL,
	[Brands] [money] NULL,
	[Generics] [money] NULL,
	[OTC] [money] NULL,
	[Total Monthly Sales] [money] NULL
) ON [PRIMARY]
GO
