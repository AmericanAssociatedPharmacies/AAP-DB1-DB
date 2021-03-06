USE [TempTables]
GO
/****** Object:  Table [dbo].[XLTest]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XLTest](
	[API Item #] [nvarchar](255) NULL,
	[NDC #] [nvarchar](255) NULL,
	[Item Description] [nvarchar](255) NULL,
	[Unit] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[Contract] [nvarchar](255) NULL,
	[API Price] [money] NULL,
	[billable cost] [float] NULL,
	[GPI] [nvarchar](255) NULL
) ON [PRIMARY]
GO
