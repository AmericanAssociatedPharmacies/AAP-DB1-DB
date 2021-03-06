USE [Reports]
GO
/****** Object:  Table [dbo].[UPCAdHoc]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPCAdHoc](
	[Plan Name] [varchar](255) NULL,
	[2013 UPC Count] [int] NULL,
	[2013 % of Total UPC Count] [float] NULL,
	[2013 Avg. Response Time in Days] [float] NULL,
	[2013 Difference From All Avg. Response Time] [float] NULL
) ON [PRIMARY]
GO
