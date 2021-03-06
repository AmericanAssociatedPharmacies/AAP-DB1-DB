USE [WebTest]
GO
/****** Object:  Table [dbo].[QC_ScanEsiDaily]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QC_ScanEsiDaily](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QC_ScanFileId] [int] NULL,
	[NCPDP] [nvarchar](8) NULL,
	[NPI] [nvarchar](11) NULL,
	[PharmacyName] [nvarchar](50) NULL,
	[CorporateName] [nvarchar](50) NULL,
	[ClientEsiId] [nvarchar](50) NULL,
	[PatientId] [nvarchar](14) NULL,
	[PatientLName] [nvarchar](36) NULL,
	[PatientFName] [nvarchar](26) NULL,
	[DOB] [nvarchar](50) NULL,
	[Phone] [nvarchar](11) NULL,
	[PlanName] [nvarchar](33) NULL,
	[CMSContractId] [nvarchar](6) NULL,
	[FirstFillDate] [nvarchar](50) NULL,
	[Drug1NpiNbr] [bigint] NULL,
	[Drug1NumFill] [int] NULL,
	[Drug1Name] [nvarchar](50) NULL,
	[Drug1GCN] [nvarchar](50) NULL,
	[Drug2NumFill] [int] NULL,
	[Drug2Name] [nvarchar](50) NULL,
	[Drug2GCN] [nvarchar](50) NULL,
	[Drug3NumFill] [int] NULL,
	[Drug3Name] [nvarchar](50) NULL,
	[Drug3GCN] [nvarchar](50) NULL,
	[Drug4NumFill] [int] NULL,
	[Drug4Name] [nvarchar](50) NULL,
	[Drug4GCN] [nvarchar](50) NULL,
	[Drug5NumFill] [int] NULL,
	[Drug5Name] [nvarchar](50) NULL,
	[Drug5GCN] [nvarchar](50) NULL,
	[IsValid] [bit] NULL,
	[filedate] [smalldatetime] NULL,
	[EsiRawTxt] [nvarchar](max) NULL,
	[ParseErrors] [nvarchar](max) NULL,
	[CardId] [nvarchar](50) NULL,
 CONSTRAINT [PK_QC_ScanEsiDaily] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[QC_ScanEsiDaily] ADD  CONSTRAINT [DF_QC_ScanEsiDaily_IsValid]  DEFAULT ((1)) FOR [IsValid]
GO
ALTER TABLE [dbo].[QC_ScanEsiDaily] ADD  CONSTRAINT [DF_QC_ScanEsiDaily_filedate]  DEFAULT (dateadd(day,(0),datediff(day,(0),getdate()))) FOR [filedate]
GO
