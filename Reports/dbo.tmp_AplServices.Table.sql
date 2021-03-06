USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_AplServices]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AplServices](
	[DirectDeposit] [varchar](128) NULL,
	[Reconciliation] [varchar](128) NULL,
	[ProfitMinder] [varchar](128) NULL,
	[GeneriCarePBM] [varchar](128) NULL,
	[GeneriCareAdKit] [varchar](128) NULL,
	[RxCare] [varchar](128) NULL,
	[ComplianceGuardian] [varchar](128) NULL,
	[PrePost] [varchar](128) NULL,
	[AAPElite] [varchar](128) NULL,
	[AutoShip] [varchar](128) NULL,
	[Planogram] [varchar](128) NULL,
	[Conference2011] [varchar](128) NULL,
	[Conference2012] [varchar](128) NULL,
	[Conference2013] [varchar](128) NULL,
	[Conference2014] [varchar](128) NULL
) ON [PRIMARY]
GO
