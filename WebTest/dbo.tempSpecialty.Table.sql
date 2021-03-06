USE [WebTest]
GO
/****** Object:  Table [dbo].[tempSpecialty]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tempSpecialty](
	[PMID] [int] NOT NULL,
	[AccountName] [varchar](65) NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[Member Status] [varchar](41) NOT NULL,
	[PM Contact] [varchar](255) NOT NULL,
	[Email] [varchar](255) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NOT NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NOT NULL,
	[ComputerSoftware] [varchar](255) NOT NULL,
	[TMFirstName] [varchar](35) NULL,
	[TMLastName] [varchar](35) NULL,
	[Enrollment completed?] [varchar](3) NOT NULL,
	[Enrollment date] [varchar](10) NULL,
	[Enrollment contact] [nvarchar](500) NULL,
	[Training completed?] [varchar](3) NOT NULL,
	[Training completion date] [varchar](10) NULL,
	[Person completing training] [nvarchar](500) NULL,
	[Post test completed?] [varchar](3) NOT NULL,
	[Requested Start date] [nvarchar](500) NULL,
	[Go live date] [varchar](10) NULL
) ON [PRIMARY]
GO
