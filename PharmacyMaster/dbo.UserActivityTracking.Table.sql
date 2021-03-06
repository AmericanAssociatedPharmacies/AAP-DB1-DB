USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[UserActivityTracking]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActivityTracking](
	[UserActivityTrackingId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[DateTimeVisited] [datetime] NOT NULL,
	[ControllerName] [varchar](255) NOT NULL,
	[URL] [varchar](255) NOT NULL,
	[ActionName] [varchar](255) NOT NULL,
	[RowCreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserActivityTrackingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserActivityTracking] ADD  DEFAULT (getdate()) FOR [RowCreated]
GO
