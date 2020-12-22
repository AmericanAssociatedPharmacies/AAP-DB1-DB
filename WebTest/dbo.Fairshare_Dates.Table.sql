USE [WebTest]
GO
/****** Object:  Table [dbo].[Fairshare_Dates]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fairshare_Dates](
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[ShipWeekOf] [datetime] NULL
) ON [PRIMARY]
GO
