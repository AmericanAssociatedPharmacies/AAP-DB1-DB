USE [Reports]
GO
/****** Object:  Table [dbo].[UPResult]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPResult](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[Result] [nvarchar](100) NULL,
	[ResponseCode] [nvarchar](50) NULL,
	[DashboardCategory] [nvarchar](100) NULL
) ON [PRIMARY]
GO
