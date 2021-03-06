USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[DirFileDistRecipient]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirFileDistRecipient](
	[DistRecipID] [int] IDENTITY(1,1) NOT NULL,
	[DirID] [int] NOT NULL,
	[FilterID] [int] NOT NULL,
	[DistOutputFormat] [varchar](30) NOT NULL,
	[DistViaFax] [varchar](3) NOT NULL,
	[DistViaEmail] [varchar](3) NOT NULL,
	[DistFromEmailAddress] [varchar](255) NULL,
	[DistViaOutputDir] [varchar](3) NOT NULL,
	[DistOutputDirectory] [varchar](255) NULL,
	[DistOutputFilePrefix] [varchar](255) NULL,
	[DistOutputFileSuffix] [varchar](255) NULL,
	[DistIndexFieldGroup] [varchar](255) NULL,
	[DistViaLotusNotes] [varchar](3) NOT NULL,
	[DistLotusNotesServer] [varchar](100) NULL,
	[DistLotusNotesDB] [varchar](100) NULL,
	[DistLotusNotesForm] [varchar](100) NULL,
	[DistLotusDataFieldGroup] [varchar](255) NULL,
	[DistLotusReaderFieldGroup] [varchar](255) NULL,
	[DistViaFTP] [varchar](3) NOT NULL,
	[DistFTPServer] [varchar](100) NULL,
	[DistFTPUser] [varchar](100) NULL,
	[DistFTPPassword] [varchar](50) NULL,
	[DistFTPDirectory] [varchar](255) NULL,
	[DistFTPPassive] [varchar](3) NULL,
	[DistFTPPort] [varchar](10) NULL,
	[DistViaAS400Outq] [varchar](3) NOT NULL,
	[DistAS400Outq] [varchar](10) NULL,
	[DistAS400OutqLib] [varchar](10) NULL,
	[DistAS400System] [varchar](20) NULL,
	[DistAS400User] [varchar](20) NULL,
	[DistAS400Password] [varchar](20) NULL,
	[DistViaSharePoint] [varchar](3) NULL,
	[DistCreateRDXFile] [varchar](3) NULL,
	[DistViaFormDocs] [varchar](3) NOT NULL,
	[DistFRMFormName] [varchar](255) NULL,
	[DistFRMPagesToStack] [int] NULL,
	[DistFRMPrinterName] [varchar](255) NULL,
	[DistFRMCopies] [int] NULL,
	[DistFRMDestinationOutputType] [varchar](30) NULL,
	[DistFRMDestinationPrinterDriverForRendering] [varchar](255) NULL,
	[DistFRMDestinationOutqOutputType] [varchar](30) NULL,
	[DistFRMDestinationOutqPrinterDriverForRendering] [varchar](255) NULL,
	[DistAS400SwapUserData] [varchar](10) NULL,
	[DistAS400SwapFormType] [varchar](10) NULL,
	[DistAS400Hold] [varchar](3) NULL,
	[DistAS400Save] [varchar](3) NULL,
	[DistActivate] [varchar](3) NOT NULL,
	[DistCCEmailAddress] [varchar](2048) NULL,
	[DistBCCEmailAddress] [varchar](2048) NULL,
	[DistReplyToEmailAddress] [varchar](255) NULL,
	[DistDataImportMask] [varchar](255) NULL,
	[DistDataImportOutputType] [varchar](40) NULL,
	[DistSpoolSearchForCriteria] [varchar](3) NULL,
	[DistSpoolSpecificSearchCriteria] [varchar](255) NULL,
	[DistSpecificSearchLines] [int] NULL,
	[DistSpecificBegColumn] [int] NULL,
	[DistSpecificEndColumn] [int] NULL,
	[DistEncryptPDF] [varchar](3) NOT NULL,
	[DistEncryptPDFPassword] [varchar](40) NULL,
	[DistEncryptPDFNoPrint] [varchar](3) NULL,
	[DistEncryptPDFNoChange] [varchar](3) NULL,
	[DistEncryptPDFNoCopy] [varchar](3) NULL,
	[DistEncryptPDFNoAnnot] [varchar](3) NULL,
	[DistSendIndividualEmail] [varchar](3) NULL,
	[DistEmailSubject] [varchar](255) NULL,
	[DistEmailPriority] [varchar](1) NULL,
	[DistReportDescription] [varchar](255) NULL,
	[DistEmbeddedEmailAddress] [varchar](3) NULL,
	[DistLotusNotesDescription] [varchar](255) NULL,
	[DistLotusNotesScanHeader] [varchar](3) NULL,
	[DistLotusNotesLinesToScan] [smallint] NULL,
	[DistEmailEmbeddedTextOnly] [varchar](3) NULL,
	[DistEmailBodyText] [varchar](5000) NULL,
	[DistEmailBodyTextFile] [varchar](255) NULL,
	[DistImagingFolder] [varchar](255) NULL,
	[DistImagingDocType] [varchar](255) NULL,
	[DistImagingDocTitle] [varchar](255) NULL,
	[DistImagingKey01] [varchar](255) NULL,
	[DistImagingKey02] [varchar](255) NULL,
	[DistImagingKey03] [varchar](255) NULL,
	[DistImagingKey04] [varchar](255) NULL,
	[DistImagingKey05] [varchar](255) NULL,
	[DistImagingKey06] [varchar](255) NULL,
	[DistImagingKey07] [varchar](255) NULL,
	[DistImagingKey08] [varchar](255) NULL,
	[DistImagingKey09] [varchar](255) NULL,
	[DistImagingKey10] [varchar](255) NULL,
	[DistRDXOutputDirectory] [varchar](255) NULL,
	[DistWorkFlowProcess] [varchar](255) NULL,
	[DistWorkFlowClassID] [varchar](255) NULL,
	[DistWorkFlowPriorityID] [varchar](255) NULL,
	[DistImagingSystemID] [int] NULL,
	[DistViaImaging] [varchar](3) NULL,
	[DistFTPOutputFilePrefix] [varchar](255) NULL,
	[DistFTPOutputFileSuffix] [varchar](255) NULL,
	[DistSharePointOutputFilePrefix] [varchar](255) NULL,
	[DistSharePointLibrary] [varchar](255) NULL,
	[DistViaiForms] [varchar](3) NULL,
	[DistIFMFormName] [varchar](255) NULL,
	[DistIFMPrinterName] [varchar](255) NULL,
	[DistIFMCopies] [int] NULL,
	[DistIFMDestinationOutputType] [varchar](30) NULL,
	[DistIFMPageEndColumn] [int] NULL,
	[DistFaxFrom] [varchar](255) NULL,
	[DistFaxSubject] [varchar](255) NULL,
	[DistFaxSystem] [varchar](10) NULL,
	[DistIFMTextLayer] [varchar](255) NULL,
	[DistIFMShowParameters] [varchar](3) NULL,
	[DistIFMParameterName1] [varchar](255) NULL,
	[DistIFMParameterValue1] [varchar](255) NULL,
	[DistIFMParameterName2] [varchar](255) NULL,
	[DistIFMParameterValue2] [varchar](255) NULL,
	[DistIFMParameterName3] [varchar](255) NULL,
	[DistIFMParameterValue3] [varchar](255) NULL,
	[DistIFMParameterName4] [varchar](255) NULL,
	[DistIFMParameterValue4] [varchar](255) NULL,
	[DistIFMParameterName5] [varchar](255) NULL,
	[DistIFMParameterValue5] [varchar](255) NULL,
	[DistIFMParameterName6] [varchar](255) NULL,
	[DistIFMParameterValue6] [varchar](255) NULL,
	[DistIFMParameterName7] [varchar](255) NULL,
	[DistIFMParameterValue7] [varchar](255) NULL,
	[DistIFMParameterName8] [varchar](255) NULL,
	[DistIFMParameterValue8] [varchar](255) NULL,
	[DistIFMParameterName9] [varchar](255) NULL,
	[DistIFMParameterValue9] [varchar](255) NULL,
	[ProductConversion] [varchar](10) NULL,
	[DistIFMServerID] [int] NULL,
	[DistIFMCollate] [varchar](1) NULL,
	[DistIFMDuplexType] [varchar](20) NULL,
	[DistIFMOrientationType] [varchar](20) NULL,
	[DistIFMReportAS400Resource] [varchar](255) NULL,
	[DistIFMReportDatasource] [varchar](255) NULL,
	[DistIFMReportEnvironment] [varchar](255) NULL,
	[DistIFMTray] [varchar](255) NULL,
	[DistIFMShowRuntimeParameters] [varchar](1) NULL,
	[DistAttachmentName] [varchar](255) NULL,
	[MacroFilePath] [varchar](255) NOT NULL,
	[MacroName] [varchar](50) NOT NULL,
 CONSTRAINT [PK__DIRFILEDISTRECIP__0425A276] PRIMARY KEY CLUSTERED 
(
	[DistRecipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DirFileDistRecipient] ADD  CONSTRAINT [DF_DIRFILEDISTRECIPIENT_DistViaiForms]  DEFAULT ('N') FOR [DistViaiForms]
GO
ALTER TABLE [dbo].[DirFileDistRecipient] ADD  CONSTRAINT [DF_DIRFILEDISTRECIPIENT_DistIFMDestinationOutputType]  DEFAULT ('PDF') FOR [DistIFMDestinationOutputType]
GO
ALTER TABLE [dbo].[DirFileDistRecipient] ADD  DEFAULT ('') FOR [MacroFilePath]
GO
ALTER TABLE [dbo].[DirFileDistRecipient] ADD  DEFAULT ('') FOR [MacroName]
GO
