USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_AAPAdmin0310]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAPAdmin0310](
	[CA#] [float] NULL,
	[Name] [nvarchar](255) NULL,
	[DC] [float] NULL,
	[Division] [nvarchar](255) NULL,
	[Store] [nvarchar](255) NULL,
	[CCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[CCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[Total Generics] [money] NULL,
	[Brand Rx Sales] [money] NULL,
	[Extended Sales] [money] NULL,
	[AAP 0#35% Volume Admin Fee $] [money] NULL
) ON [PRIMARY]
GO
