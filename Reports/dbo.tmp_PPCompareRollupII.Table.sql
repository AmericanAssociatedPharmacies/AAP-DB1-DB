USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PPCompareRollupII]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPCompareRollupII](
	[Customer_no] [varchar](31) NULL,
	[Customer_Name] [varchar](63) NULL,
	[AAPPriceProtectionDueToDate] [money] NULL,
	[CAPriceProtectionDueToDate] [money] NULL
) ON [PRIMARY]
GO
