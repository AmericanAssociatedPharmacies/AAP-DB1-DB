USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[pm_groups_xref_031714]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_groups_xref_031714](
	[Grpxref_ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[Source] [varchar](5) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
