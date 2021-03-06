USE [WebTest]
GO
/****** Object:  Table [dbo].[RxCareParticipation]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RxCareParticipation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_registered] [datetime] NULL,
	[Pharmacy] [varchar](255) NULL,
	[NCPDP] [varchar](10) NULL,
	[NPI] [varchar](10) NULL,
	[Phone] [varchar](25) NULL,
	[Fax] [varchar](25) NULL,
	[Email] [varchar](255) NULL,
	[Alt.Email] [varchar](255) NULL,
	[Address1] [varchar](255) NULL,
	[Address2] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[Zip] [varchar](20) NULL,
	[MailAddress1] [varchar](255) NULL,
	[MailAddress2] [varchar](255) NULL,
	[MailCity] [varchar](255) NULL,
	[MailState] [varchar](50) NULL,
	[MailZip] [varchar](20) NULL,
	[PharmacyOwner] [varchar](255) NULL,
	[ManagerName] [varchar](255) NULL,
	[SoftwareSystem] [varchar](255) NULL,
	[Name] [varchar](255) NULL,
	[Title] [varchar](255) NULL,
	[Referral] [varchar](50) NULL,
	[ReferralText] [varchar](255) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RxCareParticipation] ADD  CONSTRAINT [DF_RxCareParticipation_date_registered]  DEFAULT (getdate()) FOR [date_registered]
GO
