USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[software]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[software](
	[ID] [nvarchar](255) NOT NULL,
	[SOFTWARE] [nvarchar](255) NULL,
	[Parent] [varchar](255) NULL
) ON [PRIMARY]
GO
