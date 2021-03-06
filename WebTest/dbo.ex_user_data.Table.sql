USE [WebTest]
GO
/****** Object:  Table [dbo].[ex_user_data]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ex_user_data](
	[loginid] [int] NOT NULL,
	[login] [nvarchar](50) NULL,
	[roleid] [int] NULL,
	[rolename] [nvarchar](100) NULL,
	[defaultpmid] [int] NULL,
	[nslogin] [nvarchar](50) NULL,
	[nspwd] [nvarchar](50) NULL,
	[active] [bit] NULL,
	[perms] [varchar](255) NULL,
	[pmid] [int] NULL,
	[pmparentid] [int] NULL,
	[aapaccountno] [varchar](20) NULL,
	[aapstatus] [varchar](32) NULL,
	[apiaccountno] [varchar](20) NULL,
	[ncpdp] [varchar](20) NULL,
	[dea] [varchar](50) NULL,
	[npi] [datetime] NULL,
	[statelicno] [varchar](50) NULL,
	[statelicexpdate] [varchar](30) NULL,
	[mcquitdate] [datetime] NULL,
	[accountname] [datetime] NULL,
	[corporatename] [varchar](65) NULL,
	[city] [varchar](100) NULL,
	[state] [varchar](50) NULL,
	[zip] [varchar](2) NULL,
	[phone] [varchar](50) NULL,
	[fax] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[isAPI] [varchar](80) NULL,
	[isAAP] [int] NULL,
	[isMC] [int] NULL,
	[isTSROnly] [int] NULL,
	[isElite] [int] NULL,
	[parent_account] [int] NULL,
	[TMName] [varchar](65) NULL,
	[GenLiabCarrier] [varchar](71) NULL,
	[GenInsExpDate] [varchar](50) NULL,
	[ProfLiabCarrier] [varchar](10) NULL,
	[ProfLiabInsExpDate] [varchar](50) NULL,
	[description] [varchar](10) NULL
) ON [PRIMARY]
GO
