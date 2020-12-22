USE [WebTest]
GO
/****** Object:  Table [dbo].[GMTopPlans]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMTopPlans](
	[PharmID] [nvarchar](50) NULL,
	[PlanName] [nvarchar](100) NULL,
	[BIN] [nchar](10) NULL,
	[Rank] [int] IDENTITY(1,1) NOT NULL,
	[GM] [numeric](18, 2) NULL,
	[GMPercent] [numeric](18, 2) NULL,
	[Claims] [int] NULL,
	[currentdt] [datetime] NULL
) ON [PRIMARY]
GO
