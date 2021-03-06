USE [AAP]
GO
/****** Object:  Table [dbo].[AAPMemberProgram]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPMemberProgram](
	[ProgramID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Comment] [varchar](50) NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_AAPMemberProgram] PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC,
	[AccountID] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
