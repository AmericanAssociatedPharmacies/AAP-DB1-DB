USE [reporting]
GO
/****** Object:  Table [dbo].[M2QY]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M2QY](
	[date] [datetime] NULL,
	[ycal] [int] NULL,
	[yfy] [int] NULL,
	[qcal] [int] NULL,
	[qfy] [int] NULL,
	[mcal] [int] NULL,
	[mfy] [int] NULL,
	[qscal] [nvarchar](6) NULL,
	[qsfy] [nvarchar](6) NULL
) ON [PRIMARY]
GO
