USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[lb]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lb](
	[Account Name] [nvarchar](255) NULL,
	[Mailing Address 1] [nvarchar](255) NULL,
	[Mailing Address 2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Contact Full Name] [nvarchar](255) NULL,
	[Terr#] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[AAP Account No] [float] NULL,
	[DEA] [nvarchar](255) NULL,
	[NCPDP] [float] NULL,
	[NPI] [float] NULL,
	[State Lic# No#] [nvarchar](255) NULL
) ON [PRIMARY]
GO
