USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_API_ADMIN_ORIG]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_ADMIN_ORIG](
	[APIAdminFee] [money] NULL,
	[APIGenAdminFee] [money] NULL,
	[PMID] [int] NOT NULL
) ON [PRIMARY]
GO
