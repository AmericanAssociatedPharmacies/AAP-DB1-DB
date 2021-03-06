USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[DirFileFilter]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirFileFilter](
	[FilterID] [int] IDENTITY(1,1) NOT NULL,
	[FilterInclude] [varchar](2048) NULL,
	[FilterActivate] [varchar](3) NOT NULL,
	[FilterSpool] [varchar](10) NULL,
	[FilterUserData] [varchar](10) NULL,
	[FilterFormType] [varchar](10) NULL,
	[FilterUserID] [varchar](10) NULL,
	[FilterJobName] [varchar](10) NULL,
	[FilterUserDefinedData] [varchar](255) NULL,
	[FilterPCFileName] [varchar](255) NULL,
	[FilterDesc] [varchar](50) NULL,
	[FilterExclude] [varchar](2048) NULL,
	[FilterType] [varchar](10) NULL,
	[ProductConversion] [varchar](10) NULL,
 CONSTRAINT [PK__DIRFILEFILTER__7C8480AE] PRIMARY KEY CLUSTERED 
(
	[FilterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
