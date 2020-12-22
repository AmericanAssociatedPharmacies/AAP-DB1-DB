USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_NoNDC]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NoNDC](
	[Chain] [nvarchar](255) NULL,
	[Drug] [nvarchar](255) NULL,
	[Quantity] [float] NULL,
	[Price] [float] NULL
) ON [PRIMARY]
GO
