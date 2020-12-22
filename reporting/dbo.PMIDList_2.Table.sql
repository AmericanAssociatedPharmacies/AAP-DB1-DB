USE [reporting]
GO
/****** Object:  Table [dbo].[PMIDList_2]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMIDList_2](
	[PMID] [float] NULL,
	[Name] [nvarchar](255) NULL,
	[ExecutiveEmail] [nvarchar](255) NULL,
	[StartDate] [datetime] NULL
) ON [PRIMARY]
GO
