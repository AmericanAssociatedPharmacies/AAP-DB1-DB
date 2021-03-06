USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_PMLoadCS]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PMLoadCS](
	[PMID] [numeric](18, 0) NULL,
	[OrganizationTypeDesc] [varchar](255) NULL,
	[Org_ID] [numeric](18, 0) NULL,
	[IndAuthToVote] [varchar](255) NULL,
	[MembershipTypeDesc] [varchar](255) NULL,
	[Mem_ID] [numeric](18, 0) NULL,
	[StoreContactName] [varchar](255) NULL,
	[MembershipOwner] [varchar](255) NULL
) ON [PRIMARY]
GO
