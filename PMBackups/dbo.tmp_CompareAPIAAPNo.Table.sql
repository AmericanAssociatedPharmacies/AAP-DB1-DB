USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_CompareAPIAAPNo]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CompareAPIAAPNo](
	[APIAccountNo] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[PM_AAP] [varchar](20) NULL,
	[ASW_AAP] [varchar](20) NULL
) ON [PRIMARY]
GO
