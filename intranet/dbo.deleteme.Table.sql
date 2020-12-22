USE [intranet]
GO
/****** Object:  Table [dbo].[deleteme]    Script Date: 12/22/2020 4:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deleteme](
	[Month] [float] NULL,
	[Year] [float] NULL,
	[Resource] [nvarchar](255) NULL,
	[ProjectName] [nvarchar](255) NULL,
	[TaskName] [nvarchar](255) NULL,
	[LOB] [nvarchar](255) NULL,
	[Total] [float] NULL,
	[Contractor] [float] NULL
) ON [PRIMARY]
GO
