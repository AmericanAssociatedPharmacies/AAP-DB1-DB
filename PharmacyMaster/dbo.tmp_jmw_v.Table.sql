USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_jmw_v]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_jmw_v](
	[pmid] [int] NULL,
	[Year] [varchar](4) NOT NULL,
	[NABP] [varchar](20) NULL,
	[Store Name] [varchar](65) NULL,
	[Total Cardinal Purchases] [float] NULL
) ON [PRIMARY]
GO
