USE [Reports]
GO
/****** Object:  Table [Archive].[KPIDash_AllyScripts]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[KPIDash_AllyScripts](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [varchar](255) NULL,
	[State] [char](2) NULL,
	[AAPAccountNumber] [varchar](255) NULL,
	[APIAccountNumber] [varchar](255) NULL,
	[Date] [datetime] NULL,
	[RxReceived] [int] NULL,
	[RxFilled] [int] NULL,
	[UserOriginalLogin] [varchar](255) NULL,
	[DeletedBy] [varchar](100) NULL,
	[DeletedOn] [datetime] NULL,
	[IsValid] [bit] NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Archive].[KPIDash_AllyScripts] ADD  DEFAULT ((1)) FOR [IsValid]
GO
ALTER TABLE [Archive].[KPIDash_AllyScripts] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
