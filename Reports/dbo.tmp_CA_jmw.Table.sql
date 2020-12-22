USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_CA_jmw]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CA_jmw](
	[NDC] [varchar](15) NULL,
	[CIN#] [varchar](31) NULL,
	[Description] [varchar](127) NULL,
	[Size] [numeric](8, 3) NULL,
	[Total Qty Purchased] [int] NULL,
	[Total $ Purchased] [float] NULL
) ON [PRIMARY]
GO
