USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[pm_programstepmember_101414]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_programstepmember_101414](
	[PMID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[ProgramStepID] [int] NOT NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
