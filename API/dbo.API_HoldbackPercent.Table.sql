USE [API]
GO
/****** Object:  Table [dbo].[API_HoldbackPercent]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_HoldbackPercent](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[HoldbackPercent] [decimal](18, 4) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[API_HoldbackPercent] ADD  DEFAULT ('29991231') FOR [EndDate]
GO
ALTER TABLE [dbo].[API_HoldbackPercent] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
