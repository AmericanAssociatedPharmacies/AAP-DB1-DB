USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmpActiveMemberList_08232013]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpActiveMemberList_08232013](
	[Source] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[MC Eff# Date] [datetime] NULL,
	[AAP Eff# Date] [datetime] NULL,
	[Mailing Address 1] [nvarchar](255) NULL,
	[Mailing Address 2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Owner Name] [nvarchar](255) NULL,
	[Terr#] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[AAP Status] [nvarchar](255) NULL,
	[API Status] [nvarchar](255) NULL,
	[Bus Cls] [nvarchar](255) NULL,
	[AAP Account No] [float] NULL,
	[AAP Parent No] [float] NULL,
	[API Account No] [float] NULL,
	[Managed Care CC] [float] NULL,
	[Group / Affiliate Name] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[NCPDP] [float] NULL,
	[NPI] [float] NULL,
	[State Lic# No#] [nvarchar](255) NULL,
	[GroupNo] [float] NULL
) ON [PRIMARY]
GO
