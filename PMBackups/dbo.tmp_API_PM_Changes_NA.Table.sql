USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_API_PM_Changes_NA]    Script Date: 12/22/2020 4:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_PM_Changes_NA](
	[AccountName] [varchar](100) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](100) NULL,
	[ColumnName] [varchar](100) NULL,
	[AAPValue] [varchar](100) NULL,
	[APIValue] [varchar](100) NULL
) ON [PRIMARY]
GO
