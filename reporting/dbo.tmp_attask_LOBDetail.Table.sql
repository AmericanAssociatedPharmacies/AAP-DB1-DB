USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_attask_LOBDetail]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_attask_LOBDetail](
	[type] [varchar](9) NOT NULL,
	[name] [nvarchar](512) NULL,
	[hours] [numeric](10, 2) NOT NULL,
	[entered] [varchar](8) NULL,
	[prjname] [nvarchar](255) NOT NULL,
	[taskname] [nvarchar](255) NOT NULL,
	[LOB] [nvarchar](2000) NULL
) ON [PRIMARY]
GO
