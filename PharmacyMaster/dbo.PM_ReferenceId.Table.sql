USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_ReferenceId]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_ReferenceId](
	[PMID] [int] NOT NULL,
	[IDName] [varchar](40) NOT NULL,
	[ID] [int] NOT NULL,
	[CreateDate] [smalldatetime] NULL,
	[ModifiedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_PM_ReferenceId] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC,
	[IDName] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PM_ReferenceId] ADD  CONSTRAINT [DEF_PM_ReferenceId_CreateDate]  DEFAULT ('getate()') FOR [CreateDate]
GO
ALTER TABLE [dbo].[PM_ReferenceId] ADD  CONSTRAINT [DEF_PM_ReferenceId_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
