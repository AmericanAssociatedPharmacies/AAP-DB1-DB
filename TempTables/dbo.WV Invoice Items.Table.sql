USE [TempTables]
GO
/****** Object:  Table [dbo].[WV Invoice Items]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WV Invoice Items](
	[API#] [nvarchar](255) NULL,
	[Desc1] [nvarchar](255) NULL,
	[Desc2] [nvarchar](30) NULL
) ON [PRIMARY]
GO
