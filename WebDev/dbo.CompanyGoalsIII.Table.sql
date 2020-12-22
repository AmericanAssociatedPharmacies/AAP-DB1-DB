USE [WebDev]
GO
/****** Object:  Table [dbo].[CompanyGoalsIII]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyGoalsIII](
	[Year ] [float] NULL,
	[Month ] [float] NULL,
	[Count ] [float] NULL,
	[RowID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
