USE [Reports]
GO
/****** Object:  Table [dbo].[RSE_29181211]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSE_29181211](
	[C1] [varchar](max) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[RSE_29181211] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
