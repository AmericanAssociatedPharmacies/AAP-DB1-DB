USE [TempTables]
GO
/****** Object:  Table [dbo].[MTMOutcomesReport]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTMOutcomesReport](
	[Composite Score] [float] NULL,
	[Pie Score] [float] NULL,
	[nabp] [float] NULL,
	[pharmacyname] [nvarchar](255) NULL,
	[NCPDPRelationshipID] [float] NULL,
	[NCPDPRelationshipName] [nvarchar](255) NULL,
	[NCPDPParentID] [float] NULL,
	[NCPDPParentOrg] [nvarchar](255) NULL,
	[TipOpportunities] [float] NULL,
	[CompletedTips] [float] NULL,
	[SuccessfulTips] [float] NULL,
	[TipNetEffectiveRate] [float] NULL,
	[StarTipOpportunties] [float] NULL,
	[CompletedStarTips] [float] NULL,
	[SuccessfulStarTips] [float] NULL,
	[StarNetEffectiveRate] [float] NULL,
	[CostTipOpportunities] [float] NULL,
	[CompletedCostTips] [float] NULL,
	[SuccessfulCostTips] [float] NULL,
	[CostNetEffectiveRate] [float] NULL,
	[QualityTipOpportunities] [float] NULL,
	[CompletedQualityTips] [float] NULL,
	[SuccessfulQualityTips] [float] NULL,
	[QualityNetEffectiveRate] [float] NULL,
	[CMROpportunities] [float] NULL,
	[cmroffers] [float] NULL,
	[CMRCompleted] [float] NULL,
	[CMRNetEffectiveRate] [float] NULL,
	[EligiblePatients] [float] NULL,
	[ClaimsSubmitted] [float] NULL,
	[Star Score ] [float] NULL,
	[Cost Quality Score] [float] NULL,
	[CMR Score] [float] NULL,
	[MC Status PM] [smallint] NULL,
	[AAP Status PM] [nvarchar](255) NULL,
	[NCPDP Chain Code] [varchar](3) NULL
) ON [PRIMARY]
GO
