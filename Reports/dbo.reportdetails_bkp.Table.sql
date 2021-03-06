USE [Reports]
GO
/****** Object:  Table [dbo].[reportdetails_bkp]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reportdetails_bkp](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[ReportName] [varchar](255) NULL,
	[Location] [varchar](255) NULL,
	[Frequency] [varchar](255) NULL,
	[Notify] [varchar](255) NULL,
	[Description] [varchar](500) NULL,
	[Email] [varchar](1000) NULL
) ON [PRIMARY]
GO
