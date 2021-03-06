USE [ODSIntake]
GO
/****** Object:  Table [Staging].[APIPricing]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APIPricing](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ROW] [bigint] NULL,
	[COMPANY_NO] [numeric](3, 0) NULL,
	[SKU] [varchar](20) NULL,
	[STATUS] [varchar](8) NULL,
	[PRODUCT_ONLINE] [varchar](1) NULL,
	[NAME] [char](30) NULL,
	[CATEGORY_NAME] [varchar](30) NULL,
	[CATEGORY_ID] [char](6) NULL,
	[TOP_CATEGORY_NAME] [varchar](30) NULL,
	[TOP_CATEGORY_ID] [char](6) NULL,
	[NDC] [char](13) NULL,
	[UPC] [char](18) NULL,
	[BARCODE] [char](18) NULL,
	[IS_CONTROL] [varchar](1) NULL,
	[IS_CII_CONTROL] [varchar](1) NULL,
	[IS_REMS_RESTRICTED] [varchar](1) NULL,
	[IS_REFRIGERATED] [varchar](1) NULL,
	[TAX_CLASS_NAME] [varchar](1) NULL,
	[PRICE] [numeric](9, 2) NULL,
	[CREATED] [numeric](8, 0) NULL,
	[UPDATED] [numeric](8, 0) NULL,
	[MSRP] [numeric](9, 2) NULL,
	[RELATED_SKUS] [varchar](1) NULL,
	[UPSELL_SKUS] [varchar](1) NULL,
	[ALLOCATION] [numeric](9, 2) NULL,
	[IMAGE_PATH_LG] [varchar](73) NULL,
	[WEIGHT] [numeric](11, 4) NULL,
	[DESCRIPTION] [char](30) NULL,
	[BRAND_NAME] [char](30) NULL,
	[REBATE_AMT] [numeric](11, 4) NULL,
	[RowCreatedDate] [datetime] NULL,
	[EffectiveDate] [date] NULL,
	[IsTier1] [bit] NULL,
	[IsTier2] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[APIPricing] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
