USE [Reports]
GO
/****** Object:  Table [Archive].[Archive.KPIDash_AllyScripts_old]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[Archive.KPIDash_AllyScripts_old](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [varchar](255) NULL,
	[State] [char](2) NULL,
	[AAPAccountNumber] [varchar](255) NULL,
	[APIAccountNumber] [varchar](255) NULL,
	[Date] [datetime] NULL,
	[RxReceived] [int] NULL,
	[RxFilled] [int] NULL,
	[RxTransferred] [int] NULL,
	[UserOriginalLogin] [varchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Archive_KPIDash_AllyScripts] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Archive].[Archive.KPIDash_AllyScripts_old] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
