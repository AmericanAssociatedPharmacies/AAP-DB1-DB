USE [WebDev]
GO
/****** Object:  Table [dbo].[MCCare_MDPreferred2016]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCCare_MDPreferred2016](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Plan Data Sheet ID] [int] NULL,
	[Effective Date] [datetime] NULL,
	[PLAN_NAME] [nvarchar](255) NULL,
	[CMS Name] [nvarchar](255) NULL,
	[UD Chain Code Contracted] [nvarchar](255) NULL,
	[Plan Year 2015] [nvarchar](255) NULL,
	[Plan Year 2016] [nvarchar](255) NULL,
	[BIN] [nvarchar](255) NULL,
	[PCN] [nvarchar](255) NULL,
	[Quality Performance Incentive Program] [nvarchar](255) NULL
) ON [PRIMARY]
GO
