USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[DynamicSQL]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DynamicSQL](
	[C1] [varchar](max) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DynamicSQL] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
