USE [Purchases]
GO
/****** Object:  Table [dbo].[tmp_delete_CHPH_0810]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_CHPH_0810](
	[pmid] [int] NULL,
	[customer_name] [varchar](63) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGeneric] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [numeric](1, 1) NOT NULL,
	[UDAdminOnly] [numeric](1, 1) NOT NULL
) ON [PRIMARY]
GO
