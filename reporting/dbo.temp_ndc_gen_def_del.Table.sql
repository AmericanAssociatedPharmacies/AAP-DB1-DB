USE [reporting]
GO
/****** Object:  Table [dbo].[temp_ndc_gen_def_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_ndc_gen_def_del](
	[NDC] [varchar](15) NULL,
	[QTY] [numeric](38, 0) NULL,
	[COST] [float] NULL,
	[TYPE] [varchar](3) NULL,
	[MFG] [varchar](15) NULL,
	[Description] [varchar](60) NULL
) ON [PRIMARY]
GO
