USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PPDiff_PPP_Detail]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPDiff_PPP_Detail](
	[PMID] [int] NOT NULL,
	[Account Name] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[CHAcct] [nvarchar](6) NULL,
	[File Date] [datetime] NULL,
	[Original Due To Date] [money] NULL,
	[Rebate %] [float] NULL,
	[Due To Date] [money] NULL,
	[Item#] [varchar](50) NULL,
	[Description] [varchar](255) NULL,
	[NDC] [varchar](50) NULL,
	[Protected Price] [money] NULL,
	[New Price] [money] NULL,
	[Protection Start] [datetime] NULL,
	[Protection End] [datetime] NULL,
	[Protected Qty] [int] NULL,
	[Usage To Date] [int] NULL
) ON [PRIMARY]
GO
