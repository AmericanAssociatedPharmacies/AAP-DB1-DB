USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_Q2_ALLPVA_ML]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q2_ALLPVA_ML](
	[pmid] [int] NULL,
	[TM#] [varchar](10) NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[StartDate] [datetime] NULL,
	[Name] [varchar](200) NULL,
	[City] [varchar](200) NULL,
	[ST] [varchar](2) NULL,
	[AprAPIContract] [float] NULL,
	[AprAAPContract] [float] NULL,
	[AprUDContract] [float] NULL,
	[AprTotalPVASales] [float] NULL,
	[MayAPIContract] [float] NULL,
	[MayAAPContract] [float] NULL,
	[MayUDContract] [float] NULL,
	[MayTotalPVASales] [float] NULL,
	[JunAPIContract] [float] NULL,
	[JunAAPContract] [float] NULL,
	[JunUDContract] [float] NULL,
	[JunTotalPVASales] [float] NULL,
	[TotalCHPVA] [float] NULL,
	[AprSalesML] [float] NULL,
	[MaySalesML] [float] NULL,
	[JunSalesML] [float] NULL,
	[TotalML] [float] NULL
) ON [PRIMARY]
GO
