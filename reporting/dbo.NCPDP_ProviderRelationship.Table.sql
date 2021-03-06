USE [reporting]
GO
/****** Object:  Table [dbo].[NCPDP_ProviderRelationship]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_ProviderRelationship](
	[PROVIDER_RELATIONSHIP_ID] [int] NULL,
	[RELATIONSHIP_ID] [varchar](3) NULL,
	[PROVIDER_ID] [int] NULL,
	[PAYMENT_CTR_ID] [numeric](6, 0) NULL,
	[EFF_START_DT] [datetime] NULL,
	[EFF_THROUGH_DT] [datetime] NULL
) ON [PRIMARY]
GO
