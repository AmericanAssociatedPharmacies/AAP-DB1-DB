USE [Reports]
GO
/****** Object:  Table [Staging].[ConferenceCredit]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[ConferenceCredit](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[PMID] [int] NOT NULL,
	[ConferenceCreditAmount] [money] NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[ConferenceCredit] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
