USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[ImagingDocumentTypes]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagingDocumentTypes](
	[DocumentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentTypeName] [varchar](50) NOT NULL,
	[DocumentTypeDescription] [varchar](255) NOT NULL,
	[ImagingSystemID] [int] NOT NULL
) ON [PRIMARY]
GO
