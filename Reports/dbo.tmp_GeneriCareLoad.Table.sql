USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_GeneriCareLoad]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GeneriCareLoad](
	[ProgramID] [varchar](255) NULL,
	[NCPDP] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ChainCode] [varchar](255) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]
GO
