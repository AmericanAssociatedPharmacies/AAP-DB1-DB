USE [API]
GO
/****** Object:  Table [dbo].[AS400DrugType]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AS400DrugType](
	[AccountGroupID] [varchar](10) NULL,
	[ItemGroupID] [varchar](10) NULL,
	[DrugType] [varchar](25) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AS400DrugType] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
