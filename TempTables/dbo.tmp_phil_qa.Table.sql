USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_phil_qa]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_phil_qa](
	[Whse_Inv_ID] [varchar](50) NULL,
	[VendorID] [varchar](50) NULL,
	[UD_ACCT_NUM] [varchar](50) NULL,
	[INVOICE_NUM] [varchar](50) NULL,
	[INVOICE_DT] [varchar](50) NULL,
	[INVOICE_TYPE] [varchar](50) NULL,
	[NDC] [varchar](50) NULL,
	[SHIP QTY] [varchar](50) NULL,
	[UNIT_COST_AMT] [varchar](50) NULL,
	[WAC] [varchar](50) NULL
) ON [PRIMARY]
GO
