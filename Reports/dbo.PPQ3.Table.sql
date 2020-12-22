USE [Reports]
GO
/****** Object:  Table [dbo].[PPQ3]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPQ3](
	[acct_no] [nvarchar](255) NULL,
	[vendor_id] [float] NULL,
	[vendorpair] [float] NULL,
	[vendor] [nvarchar](255) NULL,
	[volume] [float] NULL,
	[rebate] [float] NULL,
	[pmid] [float] NULL
) ON [PRIMARY]
GO
