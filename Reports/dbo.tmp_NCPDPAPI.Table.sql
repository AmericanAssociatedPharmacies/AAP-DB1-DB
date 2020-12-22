USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_NCPDPAPI]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NCPDPAPI](
	[PMID] [nvarchar](255) NULL,
	[APIAccountNo] [nvarchar](255) NULL,
	[APIStatus] [nvarchar](255) NULL,
	[DateOpened] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](255) NULL
) ON [PRIMARY]
GO
