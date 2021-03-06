USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_HoldbackPercent]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_HoldbackPercent](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[HeldBy] [varchar](50) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[HoldbackPercent] [decimal](18, 4) NULL,
	[HeldFrom] [varchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[Group_ID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PM_HoldbackPercent] ADD  DEFAULT ('29991231') FOR [EndDate]
GO
ALTER TABLE [dbo].[PM_HoldbackPercent] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
