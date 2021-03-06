USE [webdocs]
GO
/****** Object:  Table [dbo].[dmSQLHistory]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmSQLHistory](
	[ChangeID] [varchar](20) NOT NULL,
	[DatabaseVersion] [varchar](20) NOT NULL,
	[ChangeDescription] [varchar](255) NOT NULL,
	[ChangeDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmSQLHistory] ADD  CONSTRAINT [DF_Table_1_ExecuteDate]  DEFAULT (getdate()) FOR [ChangeDate]
GO
