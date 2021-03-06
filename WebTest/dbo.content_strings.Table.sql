USE [WebTest]
GO
/****** Object:  Table [dbo].[content_strings]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content_strings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [varchar](50) NOT NULL,
	[item] [varchar](255) NOT NULL,
	[value] [varchar](255) NULL,
	[modified_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL
) ON [PRIMARY]
GO
