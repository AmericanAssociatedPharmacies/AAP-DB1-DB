USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_Account_Command]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Account_Command](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Command] [varchar](1500) NULL
) ON [PRIMARY]
GO
