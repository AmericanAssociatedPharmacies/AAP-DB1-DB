USE [TempTables]
GO
/****** Object:  Table [dbo].[TempIT]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempIT](
	[Account Code] [nvarchar](50) NULL,
	[Account Name] [nvarchar](255) NULL,
	[SL Account No ] [nvarchar](50) NULL,
	[API Acct No] [nvarchar](50) NULL,
	[AAP Acct No] [nvarchar](50) NULL,
	[PMID] [nvarchar](50) NULL,
	[Street 1] [nvarchar](255) NULL,
	[Street 2] [nvarchar](50) NULL,
	[City] [nvarchar](150) NULL,
	[State Province] [nvarchar](150) NULL,
	[Zip PostCode] [nvarchar](50) NULL,
	[Description] [nvarchar](150) NULL,
	[Primary Address] [nvarchar](50) NULL
) ON [PRIMARY]
GO
