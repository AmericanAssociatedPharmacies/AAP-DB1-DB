USE [WebTest]
GO
/****** Object:  Table [dbo].[CredentialDocumentList]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CredentialDocumentList](
	[docid] [int] IDENTITY(1,1) NOT NULL,
	[docdesc] [nvarchar](max) NULL,
	[category] [varchar](100) NULL,
	[questionid] [nvarchar](50) NULL,
 CONSTRAINT [PK_Survey_Docs] PRIMARY KEY CLUSTERED 
(
	[docid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
