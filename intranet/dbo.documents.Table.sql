USE [intranet]
GO
/****** Object:  Table [dbo].[documents]    Script Date: 12/22/2020 4:34:59 AM ******/
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
ALTER TABLE [dbo].[documents] ADD  CONSTRAINT [DF_documents_active]  DEFAULT ((1)) FOR [active]
GO
