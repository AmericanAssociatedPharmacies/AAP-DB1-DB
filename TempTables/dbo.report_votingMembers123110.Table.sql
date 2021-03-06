USE [TempTables]
GO
/****** Object:  Table [dbo].[report_votingMembers123110]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_votingMembers123110](
	[pmid] [int] NOT NULL,
	[aapaccountno] [varchar](20) NULL,
	[apiaccountno] [varchar](20) NULL,
	[stores] [int] NULL,
	[ownername] [varchar](200) NULL,
	[accountname] [varchar](65) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[aapeffectivedate] [datetime] NULL,
	[aapquitdate] [datetime] NULL,
	[affiliate] [varchar](125) NULL
) ON [PRIMARY]
GO
