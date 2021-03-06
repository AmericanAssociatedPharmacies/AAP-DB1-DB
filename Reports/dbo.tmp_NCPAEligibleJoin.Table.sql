USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_NCPAEligibleJoin]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NCPAEligibleJoin](
	[PMID] [float] NULL,
	[AAPAccountNo] [float] NULL,
	[AAPParentNo] [float] NULL,
	[NCPDP] [float] NULL,
	[AccountName] [nvarchar](255) NULL,
	[Address1] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[OwnerName] [nvarchar](255) NULL,
	[Additional Contact] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[NCPA ID] [float] NULL,
	[OptOutNCPA] [nvarchar](255) NULL,
	[ReasonNotEligibleNCPA] [nvarchar](255) NULL,
	[NCPA Start Date] [datetime] NULL,
	[membertype] [nvarchar](255) NULL,
	[paid thru] [datetime] NULL,
	[NCPA Note] [nvarchar](255) NULL,
	[Amount] [money] NULL,
	[F23] [nvarchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Fax] [varchar](50) NULL
) ON [PRIMARY]
GO
