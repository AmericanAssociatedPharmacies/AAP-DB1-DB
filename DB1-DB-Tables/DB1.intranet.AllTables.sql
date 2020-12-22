USE [intranet]
GO
/****** Object:  Table [dbo].[delete_timesheet0716]    Script Date: 12/22/2020 2:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_timesheet0716](
	[Month] [float] NULL,
	[Year] [float] NULL,
	[Resource] [nvarchar](255) NULL,
	[ProjectName] [nvarchar](255) NULL,
	[TaskName] [nvarchar](255) NULL,
	[LOB] [nvarchar](255) NULL,
	[Total] [float] NULL,
	[Contractor] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deleteme]    Script Date: 12/22/2020 2:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deleteme](
	[Month] [float] NULL,
	[Year] [float] NULL,
	[Resource] [nvarchar](255) NULL,
	[ProjectName] [nvarchar](255) NULL,
	[TaskName] [nvarchar](255) NULL,
	[LOB] [nvarchar](255) NULL,
	[Total] [float] NULL,
	[Contractor] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dept]    Script Date: 12/22/2020 2:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dept](
	[deptid] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[dept] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dept] PRIMARY KEY CLUSTERED 
(
	[deptid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deptuser]    Script Date: 12/22/2020 2:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deptuser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[deptid] [int] NOT NULL,
	[username] [nvarchar](50) NULL,
 CONSTRAINT [PK_deptuser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[documentcatg]    Script Date: 12/22/2020 2:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[documentcatg](
	[catid] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_documentcatg] PRIMARY KEY CLUSTERED 
(
	[catid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[documents]    Script Date: 12/22/2020 2:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[documents](
	[docid] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[displayname] [nvarchar](200) NULL,
	[description] [text] NULL,
	[deptid] [int] NULL,
	[catid] [int] NULL,
	[filename] [nvarchar](100) NULL,
	[docsize] [nchar](10) NULL,
	[doctype] [nvarchar](50) NULL,
	[uploadedby] [nvarchar](50) NULL,
	[uploadedon] [datetime] NULL,
	[updatedby] [nvarchar](50) NULL,
	[updatedon] [datetime] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_documents] PRIMARY KEY CLUSTERED 
(
	[docid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login]    Script Date: 12/22/2020 2:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[username] [nvarchar](50) NULL,
	[logintime] [datetime] NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_bg4]    Script Date: 12/22/2020 2:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_bg4](
	[Month] [int] NULL,
	[Year] [int] NULL,
	[Resource] [nvarchar](255) NULL,
	[ProjectName] [nvarchar](255) NULL,
	[TaskName] [nvarchar](255) NULL,
	[LOB] [nvarchar](255) NULL,
	[Total] [numeric](18, 2) NULL,
	[Contractor] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[documents] ADD  CONSTRAINT [DF_documents_active]  DEFAULT ((1)) FOR [active]
GO
