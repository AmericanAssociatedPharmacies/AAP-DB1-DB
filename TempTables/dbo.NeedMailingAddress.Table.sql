USE [TempTables]
GO
/****** Object:  Table [dbo].[NeedMailingAddress]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NeedMailingAddress](
	[AccountName] [nvarchar](255) NULL,
	[Addr1] [nvarchar](255) NULL,
	[Addr2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Cardinal Account #] [float] NULL,
	[ContactFullName] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[AAPAccountNo] [nvarchar](255) NULL,
	[dea] [nvarchar](255) NULL,
	[PMID] [float] NULL,
	[ncpdp] [nvarchar](255) NULL,
	[npi] [nvarchar](255) NULL,
	[F16] [nvarchar](255) NULL,
	[F17] [nvarchar](255) NULL,
	[F18] [nvarchar](255) NULL,
	[F19] [nvarchar](255) NULL
) ON [PRIMARY]
GO
