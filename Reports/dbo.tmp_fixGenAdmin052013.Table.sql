USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_fixGenAdmin052013]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_fixGenAdmin052013](
	[PMID] [varchar](255) NULL,
	[SourceGenerics] [money] NULL,
	[OrigIPAGenAdminFee] [nvarchar](255) NULL,
	[OrigEstGenAdminFee] [money] NULL,
	[NewGenAdminFee] [money] NULL
) ON [PRIMARY]
GO
