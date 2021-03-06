USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[COG]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COG](
	[Ship To Division] [nvarchar](50) NULL,
	[Ship To Division Name] [nvarchar](50) NULL,
	[Ship To Number] [nvarchar](50) NULL,
	[Ship To Name] [nvarchar](50) NULL,
	[Ship To Address 1] [nvarchar](50) NULL,
	[Ship To City] [nvarchar](50) NULL,
	[Ship To State] [nvarchar](50) NULL,
	[DEA Registration Number] [nvarchar](50) NULL,
	[Default Buy Plan %] [numeric](18, 4) NULL,
	[AR2000 Terms Code] [nvarchar](50) NULL,
	[AR2000 Terms Code Description] [nvarchar](50) NULL,
	[Contract Group Number] [nvarchar](50) NULL,
	[Contract Group Effective Date] [nvarchar](50) NULL,
	[Actual WAPD 90 days] [nvarchar](50) NULL,
	[MMP DSO 90 days] [nvarchar](50) NULL
) ON [PRIMARY]
GO
