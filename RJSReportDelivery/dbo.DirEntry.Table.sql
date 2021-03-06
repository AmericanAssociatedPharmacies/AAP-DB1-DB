USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[DirEntry]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirEntry](
	[DirID] [int] IDENTITY(1,1) NOT NULL,
	[DirDescription] [varchar](100) NULL,
	[DirName] [varchar](255) NULL,
	[DiriSeriesOutq] [varchar](10) NULL,
	[DiriSeriesOutqLib] [varchar](10) NULL,
	[DirActivate] [varchar](3) NOT NULL,
	[ThreadID] [smallint] NOT NULL,
	[DirAfterProcessOption] [varchar](50) NOT NULL,
	[DirMoveToPath] [varchar](255) NULL,
	[DirMoveToOutq] [varchar](10) NULL,
	[DirMoveToOutqLib] [varchar](10) NULL,
	[DirZipFile] [varchar](3) NULL,
	[DirZipPassword] [varchar](50) NULL,
	[DirEncryptFile] [varchar](3) NULL,
	[DirEncryptPassword] [varchar](50) NULL,
	[DirEncryptionType] [varchar](10) NULL,
	[SystemId] [int] NOT NULL,
	[DirFromEmailAddress] [varchar](255) NULL,
	[DirReplyToEmailAddress] [varchar](255) NULL,
	[DirErrorOutq] [varchar](10) NULL,
	[DirErrorOutqLib] [varchar](10) NULL,
	[DirErrorDir] [varchar](255) NULL,
	[ProductConversion] [varchar](10) NULL,
	[DirAttachmentName] [varchar](255) NULL,
 CONSTRAINT [PK__DIRENTRY__09DE7BCC] PRIMARY KEY CLUSTERED 
(
	[DirID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
