USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_2013ClaimCountByPBM]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_2013ClaimCountByPBM](
	[PlanName] [nvarchar](200) NULL,
	[planCount] [int] NULL
) ON [PRIMARY]
GO
