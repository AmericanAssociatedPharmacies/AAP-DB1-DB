USE [WebTest]
GO
/****** Object:  Table [dbo].[QC_tmp_ACcounts]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QC_tmp_ACcounts](
	[ncpdp] [varchar](20) NULL,
	[DDI_rows] [int] NULL,
	[HRM_rows] [int] NULL,
	[accountname] [varchar](65) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL
) ON [PRIMARY]
GO
