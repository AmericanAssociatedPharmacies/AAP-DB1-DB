USE [reporting]
GO
/****** Object:  Table [dbo].[PlanOGram2016_wPMID]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanOGram2016_wPMID](
	[PMID] [float] NULL,
	[Account] [nvarchar](255) NULL,
	[Address1] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Type] [nvarchar](255) NULL,
	[Subtype] [nvarchar](255) NULL,
	[AAP ID] [float] NULL,
	[API ID] [float] NULL,
	[FullName] [nvarchar](255) NULL,
	[Rebate] [float] NULL
) ON [PRIMARY]
GO
