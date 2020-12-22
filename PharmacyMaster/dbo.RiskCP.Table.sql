USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[RiskCP]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RiskCP](
	[ncpdp] [varchar](7) NULL,
	[yr] [int] NULL,
	[mo] [int] NULL,
	[CPamount] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
