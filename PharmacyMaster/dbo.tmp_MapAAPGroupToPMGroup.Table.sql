USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_MapAAPGroupToPMGroup]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MapAAPGroupToPMGroup](
	[AAPGroup] [varchar](50) NULL,
	[PMGroupNo] [int] NULL
) ON [PRIMARY]
GO
