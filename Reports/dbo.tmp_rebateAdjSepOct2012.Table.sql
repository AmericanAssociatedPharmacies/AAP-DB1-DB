USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_rebateAdjSepOct2012]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_rebateAdjSepOct2012](
	[PMID] [nvarchar](255) NULL,
	[Adjust Month] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Generic Source] [money] NULL,
	[Original rebate] [money] NULL,
	[New Rebate] [money] NULL,
	[TRUE-UP] [money] NULL,
	[F10] [nvarchar](255) NULL,
	[F11] [nvarchar](255) NULL
) ON [PRIMARY]
GO
