USE [AAPReportServer]
GO
/****** Object:  Table [dbo].[UpgradeInfo]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpgradeInfo](
	[Item] [nvarchar](260) NOT NULL,
	[Status] [nvarchar](512) NULL,
 CONSTRAINT [PK_UpgradeInfo] PRIMARY KEY CLUSTERED 
(
	[Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
