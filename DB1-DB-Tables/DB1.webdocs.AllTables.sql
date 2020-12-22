USE [webdocs]
GO
/****** Object:  Table [dbo].[dmActivity]    Script Date: 12/22/2020 3:52:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmActivity](
	[ActivityKey] [char](36) NOT NULL,
	[ActivityCode] [int] NOT NULL,
	[ActivityDateTime] [datetime] NULL,
	[DocumentKey] [char](36) NULL,
	[UserKey] [char](36) NULL,
	[ActivityDesc] [varchar](256) NOT NULL,
 CONSTRAINT [PK_dmActivity] PRIMARY KEY NONCLUSTERED 
(
	[ActivityKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmActivityCode]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmActivityCode](
	[ActivityCode] [int] NOT NULL,
	[ActivityDesc] [varchar](256) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmAuthenticationServer]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmAuthenticationServer](
	[Id] [char](36) NOT NULL,
	[Address] [varchar](128) NOT NULL,
	[PortNumber] [int] NOT NULL,
	[ServerType] [int] NOT NULL,
	[Description] [varchar](128) NOT NULL,
 CONSTRAINT [PK_dmAuthenticationServer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmAuthenticationServerCredential]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmAuthenticationServerCredential](
	[AuthenticationServerId] [char](36) NOT NULL,
	[ServerLogOnName] [varchar](128) NOT NULL,
	[ServerLogOnPassword] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmClient]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmClient](
	[Id] [nvarchar](60) NOT NULL,
	[Secret] [varchar](1024) NULL,
	[Name] [nvarchar](100) NOT NULL,
	[EmailAddress] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Phone] [nvarchar](25) NOT NULL,
	[ApplicationType] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[RefreshTokenLifeTime] [int] NOT NULL,
	[AllowedOrigin] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dmClient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmContact]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmContact](
	[ContactKey] [char](36) NOT NULL,
	[WebDocsOwnerKey] [char](36) NOT NULL,
	[FirstName] [varchar](40) NOT NULL,
	[LastName] [varchar](40) NOT NULL,
	[EmailAddress] [varchar](128) NOT NULL,
 CONSTRAINT [PK_dmContact] PRIMARY KEY CLUSTERED 
(
	[ContactKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmDeletedDocuments]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmDeletedDocuments](
	[DocumentKey] [char](36) NOT NULL,
	[FolderKey] [char](36) NOT NULL,
	[TimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_dmDeletedDocuments] PRIMARY KEY NONCLUSTERED 
(
	[DocumentKey] ASC,
	[FolderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmDiagEvents]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmDiagEvents](
	[EventKey] [bigint] IDENTITY(1,1) NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [char](10) NOT NULL,
	[EventTargetKey] [char](36) NOT NULL,
	[EventMessage] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmDocument]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmDocument](
	[DocumentKey] [char](36) NOT NULL,
	[ChangeDate] [datetime] NULL,
	[DocumentTitle] [varchar](256) NOT NULL,
	[FileName] [varchar](255) NOT NULL,
	[DocTypeKey] [char](36) NULL,
	[LocationKey] [char](36) NULL,
	[LastVerified] [datetime] NULL,
	[TimeStamp] [timestamp] NULL,
	[UserDefined1] [varchar](256) NULL,
	[UserDefined2] [varchar](256) NULL,
	[UserDefined3] [varchar](256) NULL,
	[UserDefined4] [varchar](256) NULL,
	[UserDefined5] [varchar](256) NULL,
	[UserDefined6] [varchar](256) NULL,
	[UserDefined7] [varchar](256) NULL,
	[UserDefined8] [varchar](256) NULL,
	[UserDefined9] [varchar](256) NULL,
	[UserDefined10] [varchar](256) NULL,
	[UserDefined11] [varchar](256) NULL,
	[UserDefined12] [varchar](256) NULL,
	[UserDefined13] [varchar](256) NULL,
	[UserDefined14] [varchar](256) NULL,
	[UserDefined15] [varchar](256) NULL,
	[UserDefined16] [varchar](256) NULL,
	[UserDefined17] [varchar](256) NULL,
	[UserDefined18] [varchar](256) NULL,
	[UserDefined19] [varchar](256) NULL,
	[UserDefined20] [varchar](256) NULL,
	[InsertDate] [datetime] NOT NULL,
	[CheckoutUserKey] [char](36) NULL,
	[LocationInsertDate] [datetime] NULL,
	[ExpireDate] [datetime] NULL,
	[UserDefined21] [varchar](256) NULL,
	[UserDefined22] [varchar](256) NULL,
	[UserDefined23] [varchar](256) NULL,
	[UserDefined24] [varchar](256) NULL,
	[UserDefined25] [varchar](256) NULL,
	[UserDefined26] [varchar](256) NULL,
	[UserDefined27] [varchar](256) NULL,
	[UserDefined28] [varchar](256) NULL,
	[UserDefined29] [varchar](256) NULL,
	[UserDefined30] [varchar](256) NULL,
	[FullTextIndexStatus] [varchar](255) NULL,
	[NeedsKeyIndex] [bit] NOT NULL,
	[NeedsFullTextIndex] [bit] NOT NULL,
	[FolderKey] [char](36) NOT NULL,
 CONSTRAINT [PK_dmDocument] PRIMARY KEY NONCLUSTERED 
(
	[DocumentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmDocumentField]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmDocumentField](
	[FieldKey] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentKey] [char](36) NOT NULL,
	[FieldId] [varchar](10) NOT NULL,
	[FieldValue] [varchar](256) NOT NULL,
 CONSTRAINT [PK_dmDocumentField] PRIMARY KEY NONCLUSTERED 
(
	[FieldKey] ASC,
	[DocumentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmDocumentTextContent]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmDocumentTextContent](
	[DocumentKey] [char](36) NOT NULL,
	[FullTextContent] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmDocumentType]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmDocumentType](
	[DocTypeKey] [char](36) NOT NULL,
	[DocTypeTitle] [varchar](256) NOT NULL,
	[Description] [varchar](80) NOT NULL,
	[ExpireDays] [int] NOT NULL,
 CONSTRAINT [PK_dmDocumentType] PRIMARY KEY NONCLUSTERED 
(
	[DocTypeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmDocumentTypeField]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmDocumentTypeField](
	[DocTypeKey] [char](36) NOT NULL,
	[FieldKey] [int] NOT NULL,
	[FieldDesc] [varchar](256) NOT NULL,
	[TimeStamp] [timestamp] NULL,
	[FieldType] [char](1) NULL,
	[EditMask] [varchar](256) NULL,
	[ListType] [char](1) NULL,
	[Required] [bit] NULL,
 CONSTRAINT [PK_dmDocumentTypeField] PRIMARY KEY NONCLUSTERED 
(
	[DocTypeKey] ASC,
	[FieldKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmDocumentTypeFieldVal]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmDocumentTypeFieldVal](
	[DocTypeKey] [char](36) NOT NULL,
	[FieldKey] [int] NOT NULL,
	[ValKey] [int] NOT NULL,
	[FieldValue] [varchar](256) NOT NULL,
 CONSTRAINT [PK_dmDocumentTypeFieldVal] PRIMARY KEY CLUSTERED 
(
	[DocTypeKey] ASC,
	[FieldKey] ASC,
	[ValKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmExpireByTypeInLocation]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmExpireByTypeInLocation](
	[DocTypeKey] [char](36) NOT NULL,
	[FromLocation] [char](36) NOT NULL,
	[ExpirationDays] [int] NOT NULL,
	[TargetLocation] [char](36) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmFiler]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmFiler](
	[DocumentKey] [char](36) NOT NULL,
	[FolderKey] [char](36) NOT NULL,
	[TimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_dmFiler] PRIMARY KEY NONCLUSTERED 
(
	[DocumentKey] ASC,
	[FolderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmFolder]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmFolder](
	[FolderKey] [char](36) NOT NULL,
	[FolderTitle] [varchar](256) NOT NULL,
	[TimeStamp] [timestamp] NULL,
	[SetLo] [int] NULL,
	[SetHi] [int] NULL,
 CONSTRAINT [PK_dmFolder] PRIMARY KEY NONCLUSTERED 
(
	[FolderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmFolderTreeDetailTemp]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmFolderTreeDetailTemp](
	[ParentKey] [char](64) NOT NULL,
	[ChildKey] [char](64) NOT NULL,
	[FolderTitle] [varchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmGroup]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmGroup](
	[GroupKey] [char](36) NOT NULL,
	[GroupName] [varchar](256) NOT NULL,
	[Description] [varchar](1024) NOT NULL,
	[TimeStamp] [timestamp] NULL,
	[GroupLoginMessage] [varchar](2048) NOT NULL,
 CONSTRAINT [PK_dmGroup] PRIMARY KEY NONCLUSTERED 
(
	[GroupKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmLdapAuthenticationServer]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmLdapAuthenticationServer](
	[AuthenticationServerId] [char](36) NOT NULL,
	[Domain] [varchar](256) NOT NULL,
	[BaseUserDn] [varchar](128) NOT NULL,
	[UseSsl] [bit] NOT NULL,
	[SecurePortNumber] [int] NOT NULL,
	[VerifySslCertificate] [bit] NOT NULL,
	[UseServerCredential] [bit] NOT NULL,
	[ServerAuthType] [int] NOT NULL,
	[UserAuthType] [int] NOT NULL,
	[UseSAMAccountName] [bit] NOT NULL,
	[EnableSearchOptionControl] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmLocation]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmLocation](
	[LocationKey] [char](36) NOT NULL,
	[Path] [varchar](255) NULL,
	[TimeStamp] [timestamp] NULL,
	[AutoSynch] [bit] NOT NULL,
	[PathFTP] [varchar](255) NOT NULL,
	[PathUNC] [varchar](255) NOT NULL,
	[PathHTTP] [varchar](255) NOT NULL,
	[ServerFTP] [varchar](255) NOT NULL,
	[ServerHTTP] [varchar](255) NOT NULL,
	[UserFTP] [varchar](25) NOT NULL,
	[PasswordFTP] [varchar](25) NOT NULL,
	[UserHTTP] [varchar](25) NOT NULL,
	[PasswordHTTP] [varchar](25) NOT NULL,
	[Title] [varchar](1024) NOT NULL,
 CONSTRAINT [PK_dmLocation] PRIMARY KEY CLUSTERED 
(
	[LocationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmMembership]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmMembership](
	[UserKey] [char](36) NOT NULL,
	[GroupKey] [char](36) NOT NULL,
	[TimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_dmMembership] PRIMARY KEY NONCLUSTERED 
(
	[UserKey] ASC,
	[GroupKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmNote]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmNote](
	[DocumentKey] [char](36) NOT NULL,
	[NoteKey] [char](36) NOT NULL,
	[GroupKey] [char](36) NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[TimeStamp] [timestamp] NULL,
	[UserKey] [char](36) NOT NULL,
	[InsertDate] [datetime] NULL,
 CONSTRAINT [PK_dmNote] PRIMARY KEY NONCLUSTERED 
(
	[DocumentKey] ASC,
	[NoteKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmNotification]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmNotification](
	[NotificationKey] [char](36) NOT NULL,
	[FolderKey] [char](36) NOT NULL,
	[UserKey] [char](36) NOT NULL,
	[NotifyOnAdd] [bit] NOT NULL,
	[AttachmentOption] [int] NOT NULL,
	[SendLink] [bit] NOT NULL,
	[NotificationType] [varchar](50) NULL,
 CONSTRAINT [PK_dmNotification] PRIMARY KEY CLUSTERED 
(
	[NotificationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmPageStatistics]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmPageStatistics](
	[Path] [varchar](255) NOT NULL,
	[QueryString] [varchar](1024) NOT NULL,
	[RequestType] [varchar](4) NOT NULL,
	[ElapsedMilliseconds] [int] NOT NULL,
	[UserAgent] [varchar](255) NOT NULL,
	[UserHostAddress] [varchar](39) NOT NULL,
	[Timestamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmPermissions]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmPermissions](
	[RequestorKey] [char](36) NOT NULL,
	[WebDocsObjectKey] [char](36) NOT NULL,
	[PermissionName] [varchar](64) NOT NULL,
	[PermissionStatus] [varchar](64) NOT NULL,
 CONSTRAINT [PK_dmPermissions] PRIMARY KEY NONCLUSTERED 
(
	[RequestorKey] ASC,
	[WebDocsObjectKey] ASC,
	[PermissionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmRefreshToken]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmRefreshToken](
	[Id] [nvarchar](255) NOT NULL,
	[Subject] [nvarchar](60) NOT NULL,
	[ClientId] [nvarchar](60) NOT NULL,
	[IssuedUtc] [datetime] NOT NULL,
	[ExpiresUtc] [datetime] NOT NULL,
	[ProtectedTicket] [varchar](1024) NULL,
	[Browser] [varchar](1024) NULL,
 CONSTRAINT [PK_dmRefreshToken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmRole]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmRole](
	[RequestorId] [char](36) NOT NULL,
	[Role] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmSavedQuery]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmSavedQuery](
	[Query] [varchar](250) NOT NULL,
	[UserKey] [char](36) NULL,
	[Count] [int] NOT NULL,
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_SavedQuery] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmSearchResults]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmSearchResults](
	[DocumentId] [char](36) NOT NULL,
	[SearchId] [char](36) NOT NULL,
	[RelevanceScore] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmSetting]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmSetting](
	[SettingsKey] [varchar](128) NOT NULL,
	[SettingsValue] [varchar](2048) NULL,
	[TimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_dmSetting] PRIMARY KEY NONCLUSTERED 
(
	[SettingsKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmSQLHistory]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmSQLHistory](
	[ChangeID] [varchar](20) NOT NULL,
	[DatabaseVersion] [varchar](20) NOT NULL,
	[ChangeDescription] [varchar](255) NOT NULL,
	[ChangeDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmUser]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmUser](
	[UserKey] [char](36) NOT NULL,
	[LoginName] [varchar](20) NOT NULL,
	[LoginPassword] [varchar](256) NOT NULL,
	[Expiration] [datetime] NULL,
	[Email] [varchar](128) NOT NULL,
	[Description] [varchar](256) NOT NULL,
	[FirstName] [varchar](40) NOT NULL,
	[LastName] [varchar](40) NOT NULL,
	[Phone] [varchar](30) NOT NULL,
	[Company] [varchar](40) NOT NULL,
	[Title] [varchar](40) NOT NULL,
	[Admin] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[TimeStamp] [timestamp] NULL,
	[CheckoutFolder] [varchar](255) NULL,
	[UseCheckoutFolder] [bit] NULL,
	[TemplateFolder] [varchar](255) NULL,
	[UseTemplateFolder] [bit] NULL,
	[LocationKey] [char](36) NULL,
	[EnterpriseWorkflowUsername] [varchar](255) NOT NULL,
	[EnterpriseWorkflowPassword] [varchar](255) NOT NULL,
	[AllowEnterpriseWorkflow] [bit] NOT NULL,
	[WebFormsUsername] [varchar](255) NOT NULL,
	[WebFormsPassword] [varchar](255) NOT NULL,
	[AllowWebForms] [bit] NOT NULL,
	[DefaultDocumentTypeKey] [char](36) NULL,
	[DefaultFolderKey] [char](36) NULL,
	[MustChangePassword] [bit] NOT NULL,
	[AuthenticationServerId] [char](36) NOT NULL,
 CONSTRAINT [PK_dmUser] PRIMARY KEY NONCLUSTERED 
(
	[UserKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_dmUser_LoginName] UNIQUE NONCLUSTERED 
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmUserSearchResults]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmUserSearchResults](
	[UserKey] [char](36) NOT NULL,
	[Results] [xml] NOT NULL,
 CONSTRAINT [PK_dmUserSearchResults] PRIMARY KEY CLUSTERED 
(
	[UserKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmVersion]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmVersion](
	[DocumentKey] [char](36) NOT NULL,
	[Extension] [varchar](10) NOT NULL,
	[Version] [int] NOT NULL,
	[VersionComment] [varchar](1024) NOT NULL,
	[UserKey] [char](36) NOT NULL,
 CONSTRAINT [PK_dmVersion] PRIMARY KEY CLUSTERED 
(
	[DocumentKey] ASC,
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmWorkflow]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmWorkflow](
	[FlowKey] [char](36) NOT NULL,
	[Description] [varchar](1024) NULL,
	[NotifyAccept] [bit] NOT NULL,
	[NotifyComplete] [bit] NOT NULL,
	[NotifyReject] [bit] NOT NULL,
	[ManagerKey] [char](36) NULL,
	[AllowReject] [bit] NOT NULL,
	[ClearOnReject] [bit] NOT NULL,
	[Title] [varchar](120) NOT NULL,
 CONSTRAINT [PK_dmWorkflow] PRIMARY KEY NONCLUSTERED 
(
	[FlowKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmWorkflowConnect]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmWorkflowConnect](
	[FromFlowKey] [char](36) NOT NULL,
	[FromStepKey] [char](36) NOT NULL,
	[ToFlowKey] [char](36) NOT NULL,
	[ToStepKey] [char](36) NOT NULL,
	[Condition] [varchar](512) NULL,
 CONSTRAINT [PK_dmWorkflowConnect] PRIMARY KEY NONCLUSTERED 
(
	[FromFlowKey] ASC,
	[FromStepKey] ASC,
	[ToFlowKey] ASC,
	[ToStepKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmWorkflowDocument]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmWorkflowDocument](
	[DocumentKey] [char](36) NOT NULL,
	[FlowKey] [char](36) NOT NULL,
	[StepKey] [char](36) NOT NULL,
	[Status] [int] NOT NULL,
	[Expiration] [datetime] NULL,
	[OwnerKey] [char](36) NOT NULL,
	[RouteManagerNotified] [bit] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_dmWorkflowDocument] PRIMARY KEY NONCLUSTERED 
(
	[DocumentKey] ASC,
	[FlowKey] ASC,
	[StepKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmWorkflowStep]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmWorkflowStep](
	[FlowKey] [char](36) NOT NULL,
	[StepKey] [char](36) NOT NULL,
	[Description] [varchar](1024) NOT NULL,
	[TimeLimit] [int] NOT NULL,
	[TimeLimitAction] [int] NOT NULL,
	[Title] [varchar](120) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[TimeLimitUM] [int] NOT NULL,
	[DiagramLeft] [int] NULL,
	[DiagramTop] [int] NULL,
	[DiagramRight] [int] NULL,
	[DiagramBottom] [int] NULL,
	[AllowComplete] [bit] NOT NULL,
	[AllowGlobalComplete] [bit] NOT NULL,
	[AllowTransfer] [bit] NOT NULL,
	[Notify] [bit] NOT NULL,
	[AllowEdit] [bit] NOT NULL,
 CONSTRAINT [PK_dmWorkflowStep] PRIMARY KEY NONCLUSTERED 
(
	[FlowKey] ASC,
	[StepKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dmWorkflowStepUser]    Script Date: 12/22/2020 3:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmWorkflowStepUser](
	[StepKey] [char](36) NOT NULL,
	[UserKey] [char](36) NOT NULL,
 CONSTRAINT [PK_dmWorkflowStepUser] PRIMARY KEY CLUSTERED 
(
	[StepKey] ASC,
	[UserKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmActivity] ADD  DEFAULT ('') FOR [ActivityDesc]
GO
ALTER TABLE [dbo].[dmAuthenticationServer] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[dmAuthenticationServer] ADD  DEFAULT ((0)) FOR [ServerType]
GO
ALTER TABLE [dbo].[dmAuthenticationServer] ADD  CONSTRAINT [dmAuthenticationServer_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[dmDiagEvents] ADD  DEFAULT (getdate()) FOR [EventTime]
GO
ALTER TABLE [dbo].[dmDiagEvents] ADD  DEFAULT ('DEBUG') FOR [EventType]
GO
ALTER TABLE [dbo].[dmDiagEvents] ADD  DEFAULT ('') FOR [EventTargetKey]
GO
ALTER TABLE [dbo].[dmDiagEvents] ADD  DEFAULT ('') FOR [EventMessage]
GO
ALTER TABLE [dbo].[dmDocument] ADD  CONSTRAINT [DF_dmDocument_InsertDate]  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[dmDocument] ADD  CONSTRAINT [DF_dmDocument_LocationInsertDate]  DEFAULT (getdate()) FOR [LocationInsertDate]
GO
ALTER TABLE [dbo].[dmDocument] ADD  CONSTRAINT [DF_dmDocument_NeedsKeyIndex]  DEFAULT ((1)) FOR [NeedsKeyIndex]
GO
ALTER TABLE [dbo].[dmDocument] ADD  CONSTRAINT [DF_dmDocument_NeedsFullTextIndex]  DEFAULT ((1)) FOR [NeedsFullTextIndex]
GO
ALTER TABLE [dbo].[dmDocument] ADD  CONSTRAINT [DF_dmDocument_FolderKey]  DEFAULT ('') FOR [FolderKey]
GO
ALTER TABLE [dbo].[dmDocumentType] ADD  CONSTRAINT [dmDocumentType_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[dmDocumentTypeField] ADD  CONSTRAINT [DF_dmDocumentTypeField_FieldType]  DEFAULT ('C') FOR [FieldType]
GO
ALTER TABLE [dbo].[dmDocumentTypeField] ADD  CONSTRAINT [DF_dmDocumentTypeField_EditMask]  DEFAULT ('') FOR [EditMask]
GO
ALTER TABLE [dbo].[dmDocumentTypeField] ADD  CONSTRAINT [DF_dmDocumentTypeField_ListType]  DEFAULT ('') FOR [ListType]
GO
ALTER TABLE [dbo].[dmDocumentTypeField] ADD  CONSTRAINT [DF_dmDocumentTypeField_Required]  DEFAULT ((0)) FOR [Required]
GO
ALTER TABLE [dbo].[dmGroup] ADD  DEFAULT ('') FOR [GroupLoginMessage]
GO
ALTER TABLE [dbo].[dmLdapAuthenticationServer] ADD  DEFAULT ((1)) FOR [UseSAMAccountName]
GO
ALTER TABLE [dbo].[dmLdapAuthenticationServer] ADD  DEFAULT ((1)) FOR [EnableSearchOptionControl]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_AutoSynch]  DEFAULT ((0)) FOR [AutoSynch]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_PathFTP]  DEFAULT ('') FOR [PathFTP]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_PathUNC]  DEFAULT ('') FOR [PathUNC]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_PathHTTP]  DEFAULT ('') FOR [PathHTTP]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_ServerFTP]  DEFAULT ('') FOR [ServerFTP]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_ServerHTTP]  DEFAULT ('') FOR [ServerHTTP]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_UserFTP]  DEFAULT ('') FOR [UserFTP]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_PasswordFTP]  DEFAULT ('') FOR [PasswordFTP]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_UserHTTP]  DEFAULT ('') FOR [UserHTTP]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_PasswordHTTP]  DEFAULT ('') FOR [PasswordHTTP]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_Title]  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[dmNote] ADD  CONSTRAINT [DF_dmNote_InsertDate]  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[dmNotification] ADD  CONSTRAINT [DF_dmNotification_NotificationKey]  DEFAULT (newid()) FOR [NotificationKey]
GO
ALTER TABLE [dbo].[dmNotification] ADD  CONSTRAINT [DF_dmNotification_NotifyAdd]  DEFAULT ((0)) FOR [NotifyOnAdd]
GO
ALTER TABLE [dbo].[dmNotification] ADD  CONSTRAINT [DF_dmNotification_SendDocument]  DEFAULT ((0)) FOR [AttachmentOption]
GO
ALTER TABLE [dbo].[dmNotification] ADD  CONSTRAINT [DF_dmNotification_SendLink]  DEFAULT ((0)) FOR [SendLink]
GO
ALTER TABLE [dbo].[dmNotification] ADD  CONSTRAINT [DF_dmNotification_NotificationType]  DEFAULT ('Email') FOR [NotificationType]
GO
ALTER TABLE [dbo].[dmPageStatistics] ADD  DEFAULT ('') FOR [QueryString]
GO
ALTER TABLE [dbo].[dmPageStatistics] ADD  DEFAULT ('') FOR [UserAgent]
GO
ALTER TABLE [dbo].[dmPageStatistics] ADD  DEFAULT ('') FOR [UserHostAddress]
GO
ALTER TABLE [dbo].[dmSavedQuery] ADD  DEFAULT ((0)) FOR [Count]
GO
ALTER TABLE [dbo].[dmSearchResults] ADD  CONSTRAINT [DF_dmSearchResults_Relevance]  DEFAULT ((1.0)) FOR [RelevanceScore]
GO
ALTER TABLE [dbo].[dmSQLHistory] ADD  CONSTRAINT [DF_Table_1_ExecuteDate]  DEFAULT (getdate()) FOR [ChangeDate]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_Admin]  DEFAULT ((0)) FOR [Admin]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_LocationKey]  DEFAULT ('') FOR [LocationKey]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_EnterpriseWorkflowUsername]  DEFAULT ('') FOR [EnterpriseWorkflowUsername]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_EnterpriseWorkflowPassword]  DEFAULT ('') FOR [EnterpriseWorkflowPassword]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_AllowEnterpriseWorkflow]  DEFAULT ((0)) FOR [AllowEnterpriseWorkflow]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_WebFormsUsername]  DEFAULT ('') FOR [WebFormsUsername]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_WebFormsPassword]  DEFAULT ('') FOR [WebFormsPassword]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_AllowWebForms]  DEFAULT ((0)) FOR [AllowWebForms]
GO
ALTER TABLE [dbo].[dmUser] ADD  DEFAULT ('') FOR [DefaultDocumentTypeKey]
GO
ALTER TABLE [dbo].[dmUser] ADD  DEFAULT ('') FOR [DefaultFolderKey]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_MustChangePassword]  DEFAULT ((0)) FOR [MustChangePassword]
GO
ALTER TABLE [dbo].[dmUser] ADD  DEFAULT ('') FOR [AuthenticationServerId]
GO
ALTER TABLE [dbo].[dmWorkflowDocument] ADD  CONSTRAINT [DF_dmWorkflowDocument_OwnerKey]  DEFAULT ('') FOR [OwnerKey]
GO
ALTER TABLE [dbo].[dmWorkflowDocument] ADD  DEFAULT ((0)) FOR [RouteManagerNotified]
GO
ALTER TABLE [dbo].[dmWorkflowDocument] ADD  CONSTRAINT [DF_dmWorkflowDocument_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_TimeLimit]  DEFAULT ((0)) FOR [TimeLimit]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_TimeLimitAction]  DEFAULT ((0)) FOR [TimeLimitAction]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_TimeLimitUM]  DEFAULT ((0)) FOR [TimeLimitUM]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_DiagramLeft]  DEFAULT ((0)) FOR [DiagramLeft]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_DiagramTop]  DEFAULT ((0)) FOR [DiagramTop]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_DiagramRight]  DEFAULT ((0)) FOR [DiagramRight]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_DiagramBottom]  DEFAULT ((0)) FOR [DiagramBottom]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_AllowComplete]  DEFAULT ((0)) FOR [AllowComplete]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_AllowGlobalComplete]  DEFAULT ((0)) FOR [AllowGlobalComplete]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_AllowTransfer]  DEFAULT ((0)) FOR [AllowTransfer]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_Notify]  DEFAULT ((0)) FOR [Notify]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_AllowEdit]  DEFAULT ((0)) FOR [AllowEdit]
GO
ALTER TABLE [dbo].[dmAuthenticationServerCredential]  WITH CHECK ADD  CONSTRAINT [FK_dmAuthenticationServerCredential_dmAuthenticationServer] FOREIGN KEY([AuthenticationServerId])
REFERENCES [dbo].[dmAuthenticationServer] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dmAuthenticationServerCredential] CHECK CONSTRAINT [FK_dmAuthenticationServerCredential_dmAuthenticationServer]
GO
ALTER TABLE [dbo].[dmLdapAuthenticationServer]  WITH CHECK ADD  CONSTRAINT [FK_dmLdapAuthenticationServer_dmAuthenticationServer] FOREIGN KEY([AuthenticationServerId])
REFERENCES [dbo].[dmAuthenticationServer] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dmLdapAuthenticationServer] CHECK CONSTRAINT [FK_dmLdapAuthenticationServer_dmAuthenticationServer]
GO
ALTER TABLE [dbo].[dmRefreshToken]  WITH CHECK ADD  CONSTRAINT [FK_dmRefreshToken_dmClient] FOREIGN KEY([ClientId])
REFERENCES [dbo].[dmClient] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dmRefreshToken] CHECK CONSTRAINT [FK_dmRefreshToken_dmClient]
GO
