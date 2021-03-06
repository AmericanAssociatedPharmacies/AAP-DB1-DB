USE [reporting]
GO
/****** Object:  Table [dbo].[pmid_list]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pmid_list](
	[PMID] [float] NULL,
	[CUSTOMER_NAME] [nvarchar](255) NULL,
	[Oct CAH Gen] [money] NULL,
	[Nov CAH Gen] [money] NULL,
	[Dec CAH Gen] [money] NULL,
	[Jan CAH Gen] [money] NULL,
	[Oct Actual CAH Gen] [money] NULL,
	[Nov Actual CAH Gen] [money] NULL,
	[Dec Actual CAH Gen] [money] NULL,
	[Jan Actual CAH Gen] [money] NULL,
	[Oct CAH Units] [float] NULL,
	[Nov CAH Units] [float] NULL,
	[Dec CAH Units] [float] NULL,
	[Jan CAH Units] [float] NULL,
	[Oct % Difference] [float] NULL,
	[Nov % Difference] [float] NULL,
	[Dec % Difference] [float] NULL,
	[Jan % Difference] [float] NULL
) ON [PRIMARY]
GO
