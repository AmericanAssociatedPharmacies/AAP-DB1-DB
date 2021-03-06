USE [reporting]
GO
/****** Object:  Table [dbo].[AllyScripts2017]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllyScripts2017](
	[Pharmacy] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[AAP #] [float] NULL,
	[API #] [float] NULL,
	[Date] [datetime] NULL,
	[F6] [nvarchar](255) NULL,
	[F7] [nvarchar](255) NULL,
	[F8] [nvarchar](255) NULL,
	[Rx's Received] [float] NULL,
	[Rx's Filled] [float] NULL,
	[Transferred] [float] NULL,
	[F12] [nvarchar](255) NULL
) ON [PRIMARY]
GO
