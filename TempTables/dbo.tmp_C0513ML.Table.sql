USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_C0513ML]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_C0513ML](
	[PMID] [float] NULL,
	[TM#] [float] NULL,
	[AAP#] [float] NULL,
	[API#] [float] NULL,
	[StartDate] [datetime] NULL,
	[Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[JanSalesML] [float] NULL,
	[FebSalesML] [float] NULL,
	[MarSalesML] [float] NULL,
	[F12] [nvarchar](255) NULL
) ON [PRIMARY]
GO
