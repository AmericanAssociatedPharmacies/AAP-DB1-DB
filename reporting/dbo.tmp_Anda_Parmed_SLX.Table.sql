USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_Anda_Parmed_SLX]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Anda_Parmed_SLX](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](4) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[vendor] [varchar](64) NULL,
	[QTR_4_08_TOTAL] [numeric](16, 2) NULL
) ON [PRIMARY]
GO
