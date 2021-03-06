USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_CardinalDCs]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CardinalDCs](
	[DCNum] [int] NULL,
	[DCName] [varchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PM_CardinalDCs] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_CardinalDCs] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_CardinalDCs] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
