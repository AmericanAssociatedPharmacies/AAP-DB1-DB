USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_ConfReg2013_MemProgs_jmw]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ConfReg2013_MemProgs_jmw](
	[PMID] [int] NOT NULL,
	[GroupNo] [varchar](20) NULL,
	[StartDate] [datetime] NULL
) ON [PRIMARY]
GO
