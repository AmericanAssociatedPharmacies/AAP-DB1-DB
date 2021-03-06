USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_SLXAccountsWB]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SLXAccountsWB](
	[LastName] [varchar](255) NULL,
	[FirstName] [varchar](255) NULL,
	[Position] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[ST] [varchar](255) NULL,
	[Zip] [varchar](50) NULL,
	[GrpAffiliation] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Fax] [varchar](255) NULL,
	[Email] [varchar](255) NULL
) ON [PRIMARY]
GO
