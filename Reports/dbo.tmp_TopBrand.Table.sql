USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_TopBrand]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_TopBrand](
	[NDC] [varchar](15) NULL,
	[Description] [varchar](127) NULL,
	[Manufacturer] [varchar](127) NULL,
	[Strength] [varchar](127) NULL,
	[Size] [float] NULL,
	[Qty Purchased] [int] NULL,
	[Cost] [float] NULL
) ON [PRIMARY]
GO
