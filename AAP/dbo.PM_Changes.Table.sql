USE [AAP]
GO
/****** Object:  Table [dbo].[PM_Changes]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Changes](
	[AccountName] [varchar](100) NULL,
	[DEA] [varchar](100) NULL,
	[ColumnName] [varchar](100) NULL,
	[ChangedFrom] [varchar](100) NULL,
	[ChangedTo] [varchar](100) NULL
) ON [PRIMARY]
GO
