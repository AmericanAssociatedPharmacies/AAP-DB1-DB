USE [Purchases]
GO
/****** Object:  Table [dbo].[report_NDCList]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_NDCList](
	[NDC] [varchar](11) NOT NULL,
	[NDC11] [varchar](11) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
