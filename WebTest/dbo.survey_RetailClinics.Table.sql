USE [WebTest]
GO
/****** Object:  Table [dbo].[survey_RetailClinics]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[survey_RetailClinics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[accountname] [nvarchar](255) NULL,
	[ncpdp] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[state] [nvarchar](255) NULL,
	[zip] [nvarchar](255) NULL,
	[contactName] [nvarchar](100) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[sqFootage] [nvarchar](100) NULL,
	[hasRoom] [bit] NULL,
	[hours] [nvarchar](255) NULL,
	[townPop] [nvarchar](255) NULL,
	[numHospitals] [nvarchar](255) NULL,
	[PMID] [int] NULL,
	[date] [datetime] NULL,
	[topInsCarrier1] [nvarchar](255) NULL,
	[topInsCarrier2] [nvarchar](255) NULL,
	[topInsCarrier3] [nvarchar](255) NULL,
	[topInsCarrier4] [nvarchar](255) NULL,
	[topInsCarrier5] [nvarchar](255) NULL,
	[preferredHealthsSystemNumPatients] [nvarchar](255) NULL,
	[preferredHealthsSystemPersonalPref] [nvarchar](255) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[survey_RetailClinics] ADD  CONSTRAINT [DF_survey_RetailClinics_date]  DEFAULT (getdate()) FOR [date]
GO
