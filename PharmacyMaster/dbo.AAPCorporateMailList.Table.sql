USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[AAPCorporateMailList]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPCorporateMailList](
	[CorpID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AccountName] [varchar](65) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDParentNo] [varchar](25) NULL,
	[Addr1] [varchar](80) NULL,
	[Addr2] [varchar](80) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](80) NULL,
	[Source] [varchar](15) NULL,
	[BusinessClass] [varchar](3) NULL,
	[Status] [varchar](50) NULL,
	[Territory] [varchar](3) NULL,
 CONSTRAINT [PK_AAPCorporateMailList] PRIMARY KEY CLUSTERED 
(
	[CorpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
