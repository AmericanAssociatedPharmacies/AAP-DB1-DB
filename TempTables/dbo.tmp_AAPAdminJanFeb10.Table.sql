USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_AAPAdminJanFeb10]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAPAdminJanFeb10](
	[Acctno] [nvarchar](255) NULL,
	[Customer] [nvarchar](255) NULL,
	[DC] [float] NULL,
	[DCCity] [nvarchar](255) NULL,
	[Metrics] [nvarchar](255) NULL,
	[CCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[CCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[Total Generics] [money] NULL,
	[Brand Rx Sales] [money] NULL,
	[Extended Sales] [money] NULL,
	[AAP 0#35% Volume Admin Fee $] [money] NULL
) ON [PRIMARY]
GO
