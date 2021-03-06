USE [AAPReportServer]
GO
/****** Object:  Table [dbo].[ConfigurationInfo]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigurationInfo](
	[ConfigInfoID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](260) NOT NULL,
	[Value] [ntext] NOT NULL,
 CONSTRAINT [PK_ConfigurationInfo] PRIMARY KEY NONCLUSTERED 
(
	[ConfigInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
