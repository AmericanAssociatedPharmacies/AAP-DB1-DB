USE [Reports]
GO
/****** Object:  Table [dbo].[RxAllyEnrollFromRxAlly]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RxAllyEnrollFromRxAlly](
	[AccountName] [varchar](255) NULL,
	[NCPDP] [varchar](255) NULL,
	[OwnerFirstName] [varchar](255) NULL,
	[OwnerLastName] [varchar](255) NULL,
	[DateSignUp] [datetime] NULL
) ON [PRIMARY]
GO
