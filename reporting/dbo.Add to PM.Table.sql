USE [reporting]
GO
/****** Object:  Table [dbo].[Add to PM]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Add to PM](
	[PMID] [nvarchar](255) NULL,
	[Acct#] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[ASW NCPDP] [nvarchar](255) NULL,
	[PM NCPDP] [nvarchar](255) NULL
) ON [PRIMARY]
GO
