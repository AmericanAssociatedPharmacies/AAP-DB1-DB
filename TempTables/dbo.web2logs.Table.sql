USE [TempTables]
GO
/****** Object:  Table [dbo].[web2logs]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[web2logs](
	[date] [datetime] NULL,
	[time] [datetime] NULL,
	[s-sitename] [nvarchar](255) NULL,
	[s-computername] [nvarchar](255) NULL,
	[s-ip] [nvarchar](255) NULL,
	[cs-method] [nvarchar](255) NULL,
	[cs-uri-stem] [nvarchar](255) NULL,
	[cs-uri-query] [nvarchar](max) NULL,
	[s-port] [float] NULL,
	[cs-username] [nvarchar](255) NULL,
	[c-ip] [nvarchar](255) NULL,
	[cs(User-Agent)] [nvarchar](max) NULL,
	[cs(Referer)] [nvarchar](max) NULL,
	[sc-status] [float] NULL,
	[sc-substatus] [float] NULL,
	[sc-win32-status] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
