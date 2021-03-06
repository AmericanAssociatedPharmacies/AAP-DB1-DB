USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_Q2_ALLPVA_ML_DYN]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q2_ALLPVA_ML_DYN](
	[pmid] [int] NULL,
	[TM#] [varchar](10) NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[StartDate] [datetime] NULL,
	[Name] [varchar](200) NULL,
	[City] [varchar](200) NULL,
	[ST] [varchar](2) NULL,
	[M1APIContract] [float] NULL,
	[M1AAPContract] [float] NULL,
	[M1UDContract] [float] NULL,
	[M1TotalPVASales] [float] NULL,
	[M2APIContract] [float] NULL,
	[M2AAPContract] [float] NULL,
	[M2UDContract] [float] NULL,
	[M2TotalPVASales] [float] NULL,
	[M3APIContract] [float] NULL,
	[M3AAPContract] [float] NULL,
	[M3UDContract] [float] NULL,
	[M3TotalPVASales] [float] NULL,
	[TotalCHPVA] [float] NULL,
	[M1SalesML] [float] NULL,
	[M2SalesML] [float] NULL,
	[M3SalesML] [float] NULL,
	[TotalML] [float] NULL
) ON [PRIMARY]
GO
