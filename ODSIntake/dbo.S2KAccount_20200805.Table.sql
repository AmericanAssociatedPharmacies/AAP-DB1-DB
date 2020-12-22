USE [ODSIntake]
GO
/****** Object:  Table [dbo].[S2KAccount_20200805]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S2KAccount_20200805](
	[DbName] [varchar](255) NULL,
	[ObjectName] [varchar](255) NULL,
	[ObjectType] [varchar](25) NULL,
	[ObjectDefinition] [varchar](max) NULL,
	[IsPossibleJoin] [bit] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[ObjectSchemaName] [varchar](25) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[S2KAccount_20200805] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
