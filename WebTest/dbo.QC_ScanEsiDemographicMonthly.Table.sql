USE [WebTest]
GO
/****** Object:  Table [dbo].[QC_ScanEsiDemographicMonthly]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QC_ScanEsiDemographicMonthly](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScanFileId] [nvarchar](50) NULL,
	[NCPDP] [varchar](50) NULL,
	[NPI] [varchar](50) NULL,
	[PHARMACY_NAME] [varchar](50) NULL,
	[CORPORATE_NAME] [varchar](50) NULL,
	[CLIENT_MEMBERSHIP_ID] [varchar](50) NULL,
	[CLIENT_ELIG_MEMBERSHIP_ID] [varchar](50) NULL,
	[PATIENT_ID] [varchar](50) NULL,
	[PATIENT_LAST_NAME] [varchar](50) NULL,
	[PAT_FIRST_NME] [varchar](50) NULL,
	[DOB] [varchar](50) NULL,
	[PHONE] [varchar](50) NULL,
	[GENDER_CDE] [varchar](50) NULL,
	[ADDRESS_LINE_1] [varchar](50) NULL,
	[ADDRESS_LINE_2] [varchar](50) NULL,
	[CITY_NME] [varchar](50) NULL,
	[STATE] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[LICS] [varchar](50) NULL,
	[Date_Last_Fill_Diabetes] [varchar](50) NULL,
	[Last_Fill_GCN_Diabetes] [varchar](50) NULL,
	[Last_Fill_Rx_Nbr_Diabetes] [varchar](50) NULL,
	[Date_Last_Fill_Hypertension] [varchar](50) NULL,
	[Last_Fill_GCN_Hypertension] [varchar](50) NULL,
	[Last_Fill_Rx_Nbr_Hypertension] [varchar](50) NULL,
	[Date_Last_Fill_cholesterol] [varchar](50) NULL,
	[Last_Fill_GCN_cholesterol] [varchar](50) NULL,
	[Last_Fill_Rx_Nbr_cholesterol] [varchar](50) NULL,
	[IsValid] [bit] NULL,
	[filedate] [smalldatetime] NULL,
	[EsiRawTxt] [nvarchar](max) NULL,
	[ParseErrors] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[QC_ScanEsiDemographicMonthly] ADD  CONSTRAINT [DF_QC_ScanEsiDemographicMonthly_IsValid]  DEFAULT ((1)) FOR [IsValid]
GO
ALTER TABLE [dbo].[QC_ScanEsiDemographicMonthly] ADD  CONSTRAINT [DF_QC_ScanEsDemographiciMonthly_filedate]  DEFAULT (dateadd(day,(0),datediff(day,(0),getdate()))) FOR [filedate]
GO
