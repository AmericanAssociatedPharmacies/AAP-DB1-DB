USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[Addressbook]    Script Date: 12/22/2020 3:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addressbook](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressEmail] [varchar](255) NULL,
	[AddressName] [varchar](100) NULL,
	[AddressCompany] [varchar](100) NULL,
	[AddressPhone] [varchar](30) NULL,
	[AddressFax] [varchar](30) NULL,
	[AddressLine1] [varchar](50) NULL,
	[AddressLine2] [varchar](50) NULL,
	[AddressCity] [varchar](50) NULL,
	[AddressState] [varchar](10) NULL,
	[AddressZip] [varchar](20) NULL,
	[AddressCountry] [varchar](50) NULL,
	[AddressMisc1] [varchar](100) NULL,
	[AddressMisc2] [varchar](100) NULL,
	[AddressMisc3] [varchar](100) NULL,
	[AddressActivate] [varchar](3) NOT NULL,
 CONSTRAINT [PK__ADDRESSBOOK__023D5A04] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AddressbookGroupXREF]    Script Date: 12/22/2020 3:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressbookGroupXREF](
	[AddressID] [int] NULL,
	[AddressGroupID] [int] NULL,
	[DistRecipID] [int] NULL,
	[Type] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AddressesInGroup]    Script Date: 12/22/2020 3:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressesInGroup](
	[AddressID] [int] NOT NULL,
	[AddressGroupID] [int] NOT NULL,
	[AddressInGroupActivate] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC,
	[AddressGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AddressGroup]    Script Date: 12/22/2020 3:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressGroup](
	[AddressGroupID] [int] IDENTITY(1,1) NOT NULL,
	[AddressGroupDesc] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DirEntry]    Script Date: 12/22/2020 3:46:49 AM ******/
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
/****** Object:  Table [dbo].[DirFileDistRecipient]    Script Date: 12/22/2020 3:46:49 AM ******/
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
/****** Object:  Table [dbo].[DirFileFilter]    Script Date: 12/22/2020 3:46:49 AM ******/
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
/****** Object:  Table [dbo].[DominoFields]    Script Date: 12/22/2020 3:46:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DominoFields](
	[DominoFieldID] [int] IDENTITY(1,1) NOT NULL,
	[DominoFieldGroup] [varchar](20) NOT NULL,
	[DominoFieldPageNumber] [int] NOT NULL,
	[DominoFieldPageLine] [int] NOT NULL,
	[DominoFieldStartPageCol] [int] NOT NULL,
	[DominoFieldEndPageCol] [int] NOT NULL,
	[DominoFieldName] [varchar](50) NOT NULL,
	[DominoFieldUseHardCodedReplace] [varchar](3) NOT NULL,
	[DominoFieldHardCodedReplaceVal] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DominoFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DominoReaders]    Script Date: 12/22/2020 3:46:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DominoReaders](
	[DominoReaderID] [int] IDENTITY(1,1) NOT NULL,
	[DominoReaderFieldGroup] [varchar](20) NOT NULL,
	[DominoReaders] [varchar](8000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DominoReaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailSubject]    Script Date: 12/22/2020 3:46:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailSubject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SpoolName] [varchar](10) NOT NULL,
	[UserData] [varchar](10) NOT NULL,
	[Subject] [varchar](200) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[iFormsRuntimeParameters]    Script Date: 12/22/2020 3:46:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iFormsRuntimeParameters](
	[RuntimeKey] [varchar](32) NOT NULL,
	[RuntimeValue] [varchar](512) NOT NULL,
	[DestinationId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[iFormsServers]    Script Date: 12/22/2020 3:46:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iFormsServers](
	[iFormsServerID] [int] IDENTITY(1,1) NOT NULL,
	[iFormsServerDescription] [varchar](50) NOT NULL,
	[iFormsServerURL] [varchar](50) NOT NULL,
	[iFormsServerUser] [varchar](50) NOT NULL,
	[iFormsServerPassword] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImagingDocumentTypeKeys]    Script Date: 12/22/2020 3:46:49 AM ******/
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
/****** Object:  Table [dbo].[ImagingDocumentTypes]    Script Date: 12/22/2020 3:46:49 AM ******/
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
/****** Object:  Table [dbo].[ImagingSystemList]    Script Date: 12/22/2020 3:46:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagingSystemList](
	[ImagingSystemID] [int] IDENTITY(1,1) NOT NULL,
	[ImagingSystemHost] [varchar](255) NOT NULL,
	[ImagingSystemType] [varchar](20) NOT NULL,
	[ImagingSystemDescription] [varchar](50) NOT NULL,
	[ImagingUserID] [varchar](50) NOT NULL,
	[ImagingPassword] [varchar](50) NOT NULL,
	[ImagingDomain] [varchar](50) NOT NULL,
	[ImagingiSeriesUserID] [varchar](20) NOT NULL,
	[ImagingiSeriesPassword] [varchar](20) NOT NULL,
	[ImagingActivate] [varchar](3) NOT NULL,
 CONSTRAINT [PK_IMAGINGSYSTEMLIST] PRIMARY KEY CLUSTERED 
(
	[ImagingSystemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LicenseInfo]    Script Date: 12/22/2020 3:46:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicenseInfo](
	[LicenseKey] [varchar](40) NOT NULL,
	[LicenseIPAddress] [varchar](50) NOT NULL,
	[LicenseHostName] [varchar](255) NOT NULL,
	[LicenseKeyDesc] [varchar](30) NOT NULL,
	[LicenseKeyValue] [varchar](2048) NOT NULL,
	[LicenseMisc1] [varchar](255) NOT NULL,
	[LicenseMisc2] [varchar](255) NOT NULL,
	[LicenseMisc3] [varchar](244) NOT NULL,
 CONSTRAINT [PK_LICENSEINFO] PRIMARY KEY CLUSTERED 
(
	[LicenseKey] ASC,
	[LicenseIPAddress] ASC,
	[LicenseHostName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOG]    Script Date: 12/22/2020 3:46:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOG](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[ThreadID] [varchar](255) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[TypeOfStatus] [varchar](20) NOT NULL,
	[Destination] [varchar](255) NOT NULL,
	[TypeOfFile] [varchar](10) NOT NULL,
	[SpoolFileQueue] [varchar](10) NOT NULL,
	[SpoolFileLibrary] [varchar](10) NOT NULL,
	[SpoolFileName] [varchar](10) NOT NULL,
	[SpoolFileUserData] [varchar](10) NOT NULL,
	[SpoolFileFormType] [varchar](10) NOT NULL,
	[SpoolFileUserDefinedData] [varchar](256) NOT NULL,
	[SpoolFileJobName] [varchar](10) NOT NULL,
	[SpoolFileJobUser] [varchar](10) NOT NULL,
	[SpoolFileJobNumber] [varchar](10) NOT NULL,
	[SpoolFileNumber] [varchar](10) NOT NULL,
	[PCFilePath] [varchar](255) NOT NULL,
	[PCFileName] [varchar](255) NOT NULL,
	[FileDate] [datetime] NOT NULL,
	[Description] [varchar](1024) NOT NULL,
 CONSTRAINT [PK_LOG] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessThreadGroups]    Script Date: 12/22/2020 3:46:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessThreadGroups](
	[ThreadID] [smallint] IDENTITY(1,1) NOT NULL,
	[ThreadDesc] [varchar](50) NOT NULL,
	[ThreadPollingInterval] [int] NOT NULL,
	[ThreadCount] [int] NOT NULL,
	[ThreadStartTime] [datetime] NOT NULL,
	[ThreadEndTime] [datetime] NOT NULL,
	[ThreadWindowsServiceName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ThreadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 12/22/2020 3:46:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[SettingKey] [varchar](100) NOT NULL,
	[SettingValue] [varchar](1024) NOT NULL,
 CONSTRAINT [PK__SETTINGS__0BC6C43E] PRIMARY KEY CLUSTERED 
(
	[SettingKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemList]    Script Date: 12/22/2020 3:46:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemList](
	[SystemId] [int] IDENTITY(1,1) NOT NULL,
	[SystemName] [varchar](255) NOT NULL,
	[SystemDesc] [varchar](50) NULL,
	[SystemUser] [varchar](50) NOT NULL,
	[SystemPassword] [varchar](50) NOT NULL,
	[SystemActivate] [varchar](3) NOT NULL,
	[SystemType] [varchar](20) NOT NULL,
	[UseSecureConnection] [bit] NULL,
 CONSTRAINT [PK__SYSTEMLIST__7E6CC920] PRIMARY KEY CLUSTERED 
(
	[SystemId] ASC
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
ALTER TABLE [dbo].[ImagingSystemList] ADD  CONSTRAINT [DF_IMAGINGSYSTEMLIST_ImagingSystemHost]  DEFAULT (' ') FOR [ImagingSystemHost]
GO
ALTER TABLE [dbo].[ImagingSystemList] ADD  CONSTRAINT [DF_IMAGINGSYSTEMLIST_ImagingSystemType]  DEFAULT (' ') FOR [ImagingSystemType]
GO
ALTER TABLE [dbo].[ImagingSystemList] ADD  CONSTRAINT [DF_IMAGINGSYSTEMLIST_ImagingSystemDescription]  DEFAULT (' ') FOR [ImagingSystemDescription]
GO
ALTER TABLE [dbo].[ImagingSystemList] ADD  CONSTRAINT [DF_IMAGINGSYSTEMLIST_ImagingUserID]  DEFAULT (' ') FOR [ImagingUserID]
GO
ALTER TABLE [dbo].[ImagingSystemList] ADD  CONSTRAINT [DF_IMAGINGSYSTEMLIST_ImagingPassword]  DEFAULT (' ') FOR [ImagingPassword]
GO
ALTER TABLE [dbo].[ImagingSystemList] ADD  CONSTRAINT [DF_IMAGINGSYSTEMLIST_ImagingDomain]  DEFAULT (' ') FOR [ImagingDomain]
GO
ALTER TABLE [dbo].[ImagingSystemList] ADD  CONSTRAINT [DF_IMAGINGSYSTEMLIST_ImagingiSeriesUserID]  DEFAULT (' ') FOR [ImagingiSeriesUserID]
GO
ALTER TABLE [dbo].[ImagingSystemList] ADD  CONSTRAINT [DF_IMAGINGSYSTEMLIST_ImagingiSeriesPassword]  DEFAULT (' ') FOR [ImagingiSeriesPassword]
GO
