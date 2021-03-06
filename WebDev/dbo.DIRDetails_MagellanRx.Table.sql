USE [WebDev]
GO
/****** Object:  Table [dbo].[DIRDetails_MagellanRx]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRDetails_MagellanRx](
	[pharmacy_npi] [nvarchar](50) NULL,
	[pharmacy_ncpdp] [nvarchar](50) NULL,
	[STORE_NAME] [nvarchar](255) NULL,
	[PHARMACY_GRP_ID] [nvarchar](50) NULL,
	[PHARMACY_GRO_NAME] [nvarchar](255) NULL,
	[PANEL_ID] [nvarchar](50) NULL,
	[PANEL_NAME] [nvarchar](255) NULL,
	[I_RX_SERVICE_REF_NO] [nvarchar](50) NULL,
	[I_SERVICE_DT] [nvarchar](50) NULL,
	[ADJUD_DT] [nvarchar](50) NULL,
	[CLAIM_TYPE_CD] [nvarchar](50) NULL,
	[I_BIN] [nvarchar](50) NULL,
	[I_PROCESSOR_CTRL_NO] [nvarchar](50) NULL,
	[brand_gen] [nvarchar](50) NULL,
	[ADJ_GROUP_ID] [nvarchar](50) NULL,
	[DIR Fee] [varchar](10) NULL
) ON [PRIMARY]
GO
