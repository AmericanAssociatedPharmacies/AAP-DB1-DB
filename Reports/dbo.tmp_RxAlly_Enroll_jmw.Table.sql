USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_RxAlly_Enroll_jmw]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_RxAlly_Enroll_jmw](
	[PMID] [int] NOT NULL,
	[AccountName] [varchar](65) NULL,
	[NCPDP] [varchar](20) NULL,
	[OwnerName] [varchar](200) NULL,
	[Email] [varchar](80) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[OtherInformation] [varchar](1) NOT NULL,
	[StartDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
