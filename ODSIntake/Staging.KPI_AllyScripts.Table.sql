USE [ODSIntake]
GO
/****** Object:  Table [Staging].[KPI_AllyScripts]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[KPI_AllyScripts](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Pharmacy] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[AAPNumber] [varchar](255) NULL,
	[APINumber] [varchar](255) NULL,
	[Date] [varchar](255) NULL,
	[RXReceived] [varchar](255) NULL,
	[RXFilled] [varchar](255) NULL,
	[RowCreateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[KPI_AllyScripts] ADD  DEFAULT (getdate()) FOR [RowCreateDate]
GO
