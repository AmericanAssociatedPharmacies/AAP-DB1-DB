USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[ImagingDocumentTypeKeys]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagingDocumentTypeKeys](
	[DocumentTypeID] [varchar](50) NOT NULL,
	[DocumentTypeKey] [varchar](50) NOT NULL,
	[DocumentTypeKeyValue] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
