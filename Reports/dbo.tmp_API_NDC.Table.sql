USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_API_NDC]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_NDC](
	[ItemDesc] [varchar](255) NULL,
	[NDC] [varchar](255) NULL,
	[PackSize] [numeric](11, 3) NULL,
	[PackDesc] [varchar](255) NULL
) ON [PRIMARY]
GO
