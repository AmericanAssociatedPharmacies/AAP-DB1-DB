USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[DataSharingAuthorization]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataSharingAuthorization](
	[PMID] [int] NULL,
	[NCPDP] [varchar](20) NULL,
	[DEA] [varchar](20) NULL,
	[PharmacySystem] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Phone] [varchar](50) NULL,
	[SystemId] [varchar](50) NULL,
	[DateSigned] [smalldatetime] NULL,
	[Comments] [varchar](500) NULL,
	[CreatedOn] [smalldatetime] NULL,
	[UpdatedOn] [smalldatetime] NULL
) ON [PRIMARY]
GO
