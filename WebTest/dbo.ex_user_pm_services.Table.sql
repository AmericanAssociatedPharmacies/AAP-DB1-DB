USE [WebTest]
GO
/****** Object:  Table [dbo].[ex_user_pm_services]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ex_user_pm_services](
	[PMID] [int] NOT NULL,
	[Diabetes Educator - Certified] [varchar](3) NOT NULL,
	[Diabetes Educator - Not Certified] [varchar](3) NOT NULL,
	[Hypertension Testing] [varchar](3) NOT NULL,
	[Asthma Services] [varchar](3) NOT NULL,
	[Cholesterol Services] [varchar](3) NOT NULL,
	[Compounding - Level 1 thru 3] [varchar](3) NOT NULL,
	[Compounding - Level 4 Sterile] [varchar](3) NOT NULL,
	[DME - Light] [varchar](3) NOT NULL,
	[DME - Heavy] [varchar](3) NOT NULL,
	[DME - Accredited Pharmacy] [varchar](3) NOT NULL,
	[340B - Contracted Self-administered] [varchar](3) NOT NULL,
	[340B - Contracted Third-party Administered] [varchar](3) NOT NULL,
	[340B - Administered By] [varchar](500) NULL,
	[Immunizations - Flu Vaccines] [varchar](3) NOT NULL,
	[Immunizations - Travel Vaccines] [varchar](3) NOT NULL,
	[Immunizations - Other] [varchar](500) NULL,
	[Weight Loss Clinics] [varchar](3) NOT NULL,
	[Nutrition Services] [varchar](3) NOT NULL,
	[Service Retirement Communities] [varchar](3) NOT NULL,
	[Service Assisted Living Facilities] [varchar](3) NOT NULL,
	[Service Hospice Centers] [varchar](3) NOT NULL,
	[Service Skilled Nursing Facilities] [varchar](3) NOT NULL,
	[Delivery Services - No Charge] [varchar](3) NOT NULL,
	[Delivery Services - Charge Fee] [varchar](3) NOT NULL
) ON [PRIMARY]
GO
