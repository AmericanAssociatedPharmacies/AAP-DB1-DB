USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_CAGen_jmw]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CAGen_jmw](
	[NDC] [varchar](15) NULL,
	[Description] [varchar](127) NULL,
	[Qty Purchased] [int] NULL,
	[Generic Sales] [float] NULL
) ON [PRIMARY]
GO
