USE [AAP]
GO
/****** Object:  Table [dbo].[AAPMember]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPMember](
	[AAPID] [varchar](12) NOT NULL,
	[AAPParentID] [varchar](12) NULL,
	[AAPPreviousGroup] [varchar](20) NULL,
	[AAPWHPlanogram] [varchar](8) NULL,
	[CreateDate] [datetime] NULL,
	[CreateUser] [varchar](12) NULL,
	[DEA_ID] [varchar](15) NULL,
	[MCDateEffective] [datetime] NULL,
	[MCPrevAffiliation] [varchar](32) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUser] [varchar](12) NULL,
	[QPS] [varchar](4) NULL,
	[WHAccountID] [varchar](32) NULL,
	[WHCreditAlert] [varchar](20) NULL,
	[WHCreditLimit] [numeric](18, 2) NULL,
	[WHFreightOption] [varchar](20) NULL,
	[WHMOT] [varchar](20) NULL,
	[WHOrderCutoff] [datetime] NULL,
	[WHPayMethod] [varchar](32) NULL,
	[WHPayTerms] [varchar](32) NULL,
	[WHVolumeBrandRX] [numeric](18, 2) NULL,
	[WHVolumeGenericRx] [numeric](18, 2) NULL,
	[WHVolumeMonthly] [numeric](18, 2) NULL,
	[WHVolumeOTC] [numeric](18, 2) NULL,
 CONSTRAINT [PK_AAPMember] PRIMARY KEY CLUSTERED 
(
	[AAPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
