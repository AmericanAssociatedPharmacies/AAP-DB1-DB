USE [WebTest]
GO
/****** Object:  Table [dbo].[GMReport_Plannames]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMReport_Plannames](
	[PLANID] [nvarchar](50) NULL,
	[PLANNAME] [nvarchar](50) NULL,
	[BIN] [nvarchar](50) NULL,
	[PCN] [nvarchar](50) NULL,
	[GROUPNBR] [nvarchar](50) NULL
) ON [PRIMARY]
GO
