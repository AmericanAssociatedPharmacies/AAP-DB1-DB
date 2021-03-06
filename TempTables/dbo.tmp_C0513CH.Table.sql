USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_C0513CH]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_C0513CH](
	[PMID] [float] NULL,
	[TM#] [float] NULL,
	[AAP#] [float] NULL,
	[API#] [float] NULL,
	[StartDate] [float] NULL,
	[Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[JanSales] [float] NULL,
	[JanUDSales] [float] NULL,
	[JanTotalPVASales] [float] NULL,
	[FebAPIContract] [float] NULL,
	[FebAAPContract] [float] NULL,
	[FebUDContract] [float] NULL,
	[FebTotalPVASales] [float] NULL,
	[MarAPIContract] [float] NULL,
	[MarAAPContract] [float] NULL,
	[MARUDContract] [float] NULL,
	[MarTotalPVASales] [float] NULL,
	[TotalSales] [float] NULL
) ON [PRIMARY]
GO
