USE [WebTest]
GO
/****** Object:  Table [dbo].[RxCareParticipationBankInfo]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RxCareParticipationBankInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_registered] [datetime] NULL,
	[Name] [varchar](255) NULL,
	[BusinessName] [varchar](255) NULL,
	[BankName] [varchar](255) NULL,
	[BankAddress1] [varchar](255) NULL,
	[BankAddress2] [varchar](255) NULL,
	[BankCity] [varchar](255) NULL,
	[BankState] [varchar](50) NULL,
	[BankZip] [varchar](20) NULL,
	[RoutingNumber] [varchar](25) NULL,
	[AccountNumber] [varchar](25) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RxCareParticipationBankInfo] ADD  CONSTRAINT [DF_RxCareParticipationBankInfo_date_registered]  DEFAULT (getdate()) FOR [date_registered]
GO
