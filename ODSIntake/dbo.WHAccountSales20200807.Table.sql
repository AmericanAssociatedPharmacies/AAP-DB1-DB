USE [ODSIntake]
GO
/****** Object:  Table [dbo].[WHAccountSales20200807]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WHAccountSales20200807](
	[Cust#] [nvarchar](255) NULL,
	[Brands] [float] NULL,
	[Generics] [float] NULL,
	[OTC] [float] NULL,
	[Total Monthly Sales] [float] NULL,
	[G1235] [float] NULL,
	[G6] [float] NULL
) ON [PRIMARY]
GO
