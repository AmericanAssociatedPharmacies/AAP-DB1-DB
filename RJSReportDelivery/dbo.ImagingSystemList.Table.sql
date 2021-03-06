USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[ImagingSystemList]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagingSystemList](
	[ImagingSystemID] [int] IDENTITY(1,1) NOT NULL,
	[ImagingSystemHost] [varchar](255) NOT NULL,
	[ImagingSystemType] [varchar](20) NOT NULL,
	[ImagingSystemDescription] [varchar](50) NOT NULL,
	[ImagingUserID] [varchar](50) NOT NULL,
	[ImagingPassword] [varchar](50) NOT NULL,
	[ImagingDomain] [varchar](50) NOT NULL,
	[ImagingiSeriesUserID] [varchar](20) NOT NULL,
	[ImagingiSeriesPassword] [varchar](20) NOT NULL,
	[ImagingActivate] [varchar](3) NOT NULL,
 CONSTRAINT [PK_IMAGINGSYSTEMLIST] PRIMARY KEY CLUSTERED 
(
	[ImagingSystemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ImagingSystemList] ADD  CONSTRAINT [DF_IMAGINGSYSTEMLIST_ImagingSystemHost]  DEFAULT (' ') FOR [ImagingSystemHost]
GO
ALTER TABLE [dbo].[ImagingSystemList] ADD  CONSTRAINT [DF_IMAGINGSYSTEMLIST_ImagingSystemType]  DEFAULT (' ') FOR [ImagingSystemType]
GO
ALTER TABLE [dbo].[ImagingSystemList] ADD  CONSTRAINT [DF_IMAGINGSYSTEMLIST_ImagingSystemDescription]  DEFAULT (' ') FOR [ImagingSystemDescription]
GO
ALTER TABLE [dbo].[ImagingSystemList] ADD  CONSTRAINT [DF_IMAGINGSYSTEMLIST_ImagingUserID]  DEFAULT (' ') FOR [ImagingUserID]
GO
ALTER TABLE [dbo].[ImagingSystemList] ADD  CONSTRAINT [DF_IMAGINGSYSTEMLIST_ImagingPassword]  DEFAULT (' ') FOR [ImagingPassword]
GO
ALTER TABLE [dbo].[ImagingSystemList] ADD  CONSTRAINT [DF_IMAGINGSYSTEMLIST_ImagingDomain]  DEFAULT (' ') FOR [ImagingDomain]
GO
ALTER TABLE [dbo].[ImagingSystemList] ADD  CONSTRAINT [DF_IMAGINGSYSTEMLIST_ImagingiSeriesUserID]  DEFAULT (' ') FOR [ImagingiSeriesUserID]
GO
ALTER TABLE [dbo].[ImagingSystemList] ADD  CONSTRAINT [DF_IMAGINGSYSTEMLIST_ImagingiSeriesPassword]  DEFAULT (' ') FOR [ImagingiSeriesPassword]
GO
