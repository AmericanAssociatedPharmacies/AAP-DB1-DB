USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_AccountDescriptions_Decommission_20190425]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AccountDescriptions_Decommission_20190425](
	[Description] [varchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
