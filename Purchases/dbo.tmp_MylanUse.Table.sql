USE [Purchases]
GO
/****** Object:  Table [dbo].[tmp_MylanUse]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MylanUse](
	[F1] [nvarchar](255) NULL,
	[F2] [nvarchar](255) NULL,
	[NDC] [float] NULL,
	[Size] [nvarchar](255) NULL,
	[Units] [float] NULL,
	[Dollars] [money] NULL,
	[Vendor Description] [nvarchar](255) NULL,
	[Vendor Number] [float] NULL,
	[CIN] [float] NULL,
	[Trade Name] [nvarchar](255) NULL,
	[Generic Name] [nvarchar](255) NULL,
	[Strength] [nvarchar](255) NULL
) ON [PRIMARY]
GO
