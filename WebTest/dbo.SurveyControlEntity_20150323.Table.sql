USE [WebTest]
GO
/****** Object:  Table [dbo].[SurveyControlEntity_20150323]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyControlEntity_20150323](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PMId] [int] NOT NULL,
	[Type] [nvarchar](150) NULL,
	[LocationType] [nvarchar](50) NULL,
	[npi] [nvarchar](11) NULL,
	[Title] [nvarchar](150) NULL,
	[EffectiveDate] [smalldatetime] NULL,
	[PercentOwnership] [int] NULL,
	[PharmacistLicense] [nvarchar](50) NULL,
	[StateIssueLicense] [nvarchar](50) NULL,
	[LicenseExpirationDate] [smalldatetime] NULL,
	[Entity] [nvarchar](250) NULL,
	[DBA] [nvarchar](250) NULL,
	[FName] [nvarchar](150) NULL,
	[MName] [nvarchar](150) NULL,
	[LName] [nvarchar](150) NULL,
	[SSN] [nvarchar](12) NULL,
	[FEIN] [nvarchar](12) NULL,
	[DOB] [smalldatetime] NULL,
	[Address] [nvarchar](250) NULL,
	[Address2] [nvarchar](250) NULL,
	[City] [nvarchar](250) NULL,
	[State] [nvarchar](15) NULL,
	[Zip] [nvarchar](15) NULL,
	[IsActive] [bit] NULL,
	[CriminalOffense] [bit] NULL,
	[HasOwnershipWithOtherStore] [bit] NULL,
	[HasRelationshipWithOtherOwner] [bit] NULL,
	[IsPIC] [bit] NULL,
	[IsControlEntity] [bit] NULL,
	[IsTechnician] [bit] NULL,
	[IsCertifiedTechnician] [bit] NULL,
	[IsPharmacist] [bit] NULL,
	[IsStoreManager] [bit] NULL,
	[PharState] [nvarchar](50) NULL,
	[PharExpDate] [smalldatetime] NULL,
	[StateLicNo] [nvarchar](50) NULL
) ON [PRIMARY]
GO
