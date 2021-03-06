USE [WebTest]
GO
/****** Object:  Table [dbo].[test_SCAN_monthly]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_SCAN_monthly](
	[NCPDP] [nvarchar](255) NULL,
	[NPI] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Corporate Name] [nvarchar](255) NULL,
	[Patient ID] [float] NULL,
	[Patient Last Name] [float] NULL,
	[Patient First Name] [float] NULL,
	[DOB] [datetime] NULL,
	[Phone] [datetime] NULL,
	[Plan Name] [nvarchar](255) NULL,
	[CMS Contract ID] [nvarchar](255) NULL,
	[Date First Identified for Adherence Opportunity (Patient)] [nvarchar](255) NULL,
	[Diabetes Medication] [nvarchar](255) NULL,
	[Diabetes PDC] [nvarchar](255) NULL,
	[Hypertension Medication] [nvarchar](255) NULL,
	[Hypertension PDC] [nvarchar](255) NULL,
	[Cholesterol Medication] [nvarchar](255) NULL,
	[Cholesterol PDC] [nvarchar](255) NULL,
	[Opportunity for Intervention  High Risk Medications] [nvarchar](255) NULL,
	[Number of HRM 2+ fills  (Drug 1)] [float] NULL,
	[Number of HRM 2+ fills (Drug 2)] [float] NULL,
	[Diabetes Treatment-Use of ACE/ARBs] [nvarchar](255) NULL,
	[Total Number of patients] [nvarchar](255) NULL,
	[Weightage] [float] NULL,
	[TOTAL_PAT_NDC_CLMS] [nvarchar](255) NULL,
	[TOTAL_PAT_NABP_CLMS] [nvarchar](255) NULL,
	[HRM_NDC] [float] NULL,
	[TOTAL_PAT_NDC_CLMS1] [nvarchar](255) NULL,
	[F29] [nvarchar](255) NULL,
	[F30] [nvarchar](255) NULL
) ON [PRIMARY]
GO
