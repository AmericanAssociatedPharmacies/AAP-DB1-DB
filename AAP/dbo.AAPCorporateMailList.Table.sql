USE [AAP]
GO
/****** Object:  Table [dbo].[AAPCorporateMailList]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPCorporateMailList](
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
	[ContactFirst] [varchar](50) NULL,
	[ContactLast] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[AreaCode] [varchar](3) NULL,
	[Phone] [varchar](50) NULL,
	[FaxAreaCode] [varchar](3) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](80) NULL,
	[Source] [varchar](15) NULL,
	[BusinessClass] [varchar](3) NULL,
	[Status] [varchar](50) NULL,
	[Territory] [varchar](3) NULL
) ON [PRIMARY]
GO
