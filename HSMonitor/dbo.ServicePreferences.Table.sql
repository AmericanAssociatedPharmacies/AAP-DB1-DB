USE [HSMonitor]
GO
/****** Object:  Table [dbo].[ServicePreferences]    Script Date: 12/22/2020 4:30:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePreferences](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](250) NOT NULL,
	[PreferenceName] [nvarchar](250) NOT NULL,
	[PreferenceValue] [nvarchar](250) NULL,
	[MonitorLevel] [int] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ModifyDate] [datetime2](7) NULL,
	[IsBasePreference] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ServicePreferences] ADD  DEFAULT ((0)) FOR [MonitorLevel]
GO
ALTER TABLE [dbo].[ServicePreferences] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
