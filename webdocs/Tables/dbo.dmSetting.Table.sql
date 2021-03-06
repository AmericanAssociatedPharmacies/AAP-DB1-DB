USE [webdocs]
GO
/****** Object:  Table [dbo].[dmSetting]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmSetting](
	[SettingsKey] [varchar](128) NOT NULL,
	[SettingsValue] [varchar](2048) NULL,
	[TimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_dmSetting] PRIMARY KEY NONCLUSTERED 
(
	[SettingsKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
