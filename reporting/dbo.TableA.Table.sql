USE [reporting]
GO
/****** Object:  Table [dbo].[TableA]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableA](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[SSNum] [int] NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TableA] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
