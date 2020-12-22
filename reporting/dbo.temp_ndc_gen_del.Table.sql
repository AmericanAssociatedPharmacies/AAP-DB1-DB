USE [reporting]
GO
/****** Object:  Table [dbo].[temp_ndc_gen_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_ndc_gen_del](
	[ndc] [varchar](15) NULL,
	[qty] [numeric](38, 0) NULL,
	[Cost] [float] NULL
) ON [PRIMARY]
GO
