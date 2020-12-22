USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_RPDA_APICAQtr_jmw]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_RPDA_APICAQtr_jmw](
	[PMID] [nvarchar](255) NULL,
	[Q1 API Cardinal Rebate] [money] NULL,
	[Q2 API Cardinal Rebate] [money] NULL,
	[Q3 API Cardinal Rebate] [money] NULL,
	[Q4 API Cardinal Rebate] [money] NULL
) ON [PRIMARY]
GO
