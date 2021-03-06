USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_ProgramStepMember]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_ProgramStepMember](
	[PMID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[ProgramStepID] [int] NOT NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
 CONSTRAINT [PK_PM_ProgramStepMember] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC,
	[ProgramID] ASC,
	[ProgramStepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
