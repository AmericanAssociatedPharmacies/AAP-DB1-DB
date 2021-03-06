USE [reporting]
GO
/****** Object:  Table [dbo].[test_NADAC]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_NADAC](
	[NDC Description] [nvarchar](255) NULL,
	[NDC] [nvarchar](255) NULL,
	[NADAC_Per Unit] [money] NULL,
	[Effective_Date] [datetime] NULL,
	[Pricing_Unit] [nvarchar](255) NULL,
	[Pharmacy_Type_Indicator] [nvarchar](255) NULL,
	[OTC] [nvarchar](255) NULL,
	[Explanation_Code] [nvarchar](255) NULL,
	[Classification_for Rate_Setting] [nvarchar](255) NULL,
	[Corresponding_Generic Drug_NADAC_Per Unit] [nvarchar](255) NULL,
	[Corresponding_Generic Drug_Effective_Date] [nvarchar](255) NULL,
	[F12] [nvarchar](255) NULL
) ON [PRIMARY]
GO
