USE [API]
GO
/****** Object:  Table [dbo].[Audit_DB1_20180821]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_DB1_20180821](
	[NDC] [varchar](11) NULL,
	[Mnth] [int] NULL,
	[Yr] [int] NULL,
	[Unit] [varchar](2) NULL,
	[PS] [numeric](8, 3) NULL,
	[Qty] [numeric](38, 2) NULL,
	[TotalDose] [numeric](38, 5) NULL
) ON [PRIMARY]
GO
