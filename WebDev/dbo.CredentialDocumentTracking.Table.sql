USE [WebDev]
GO
/****** Object:  Table [dbo].[CredentialDocumentTracking]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CredentialDocumentTracking](
	[docdetid] [int] IDENTITY(1,1) NOT NULL,
	[docid] [int] NULL,
	[pmid] [nvarchar](50) NULL,
	[filename] [nvarchar](max) NULL,
	[send] [int] NULL,
	[doctype] [nvarchar](50) NULL,
	[uploadedby] [nvarchar](50) NULL,
	[uploadedon] [smalldatetime] NULL,
 CONSTRAINT [PK_SurveyDocDet] PRIMARY KEY CLUSTERED 
(
	[docdetid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CredentialDocumentTracking] ADD  CONSTRAINT [DF_SurveyDocDet_send]  DEFAULT ((0)) FOR [send]
GO
ALTER TABLE [dbo].[CredentialDocumentTracking]  WITH CHECK ADD  CONSTRAINT [FK_SurveyDocDet_SurveyDoc] FOREIGN KEY([docid])
REFERENCES [dbo].[CredentialDocumentList] ([docid])
GO
ALTER TABLE [dbo].[CredentialDocumentTracking] CHECK CONSTRAINT [FK_SurveyDocDet_SurveyDoc]
GO
