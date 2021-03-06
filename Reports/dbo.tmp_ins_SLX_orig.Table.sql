USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_ins_SLX_orig]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ins_SLX_orig](
	[DEA] [varchar](50) NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[AccountName] [varchar](255) NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[ST] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [varchar](50) NULL
) ON [PRIMARY]
GO
