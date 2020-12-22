USE [intranet]
GO
/****** Object:  Table [dbo].[tmp_delete_bg4]    Script Date: 12/22/2020 4:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_bg4](
	[Month] [int] NULL,
	[Year] [int] NULL,
	[Resource] [nvarchar](255) NULL,
	[ProjectName] [nvarchar](255) NULL,
	[TaskName] [nvarchar](255) NULL,
	[LOB] [nvarchar](255) NULL,
	[Total] [numeric](18, 2) NULL,
	[Contractor] [int] NULL
) ON [PRIMARY]
GO
