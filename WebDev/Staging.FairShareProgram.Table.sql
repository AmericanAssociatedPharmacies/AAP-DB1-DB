USE [WebDev]
GO
/****** Object:  Table [Staging].[FairShareProgram]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[FairShareProgram](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustNum] [varchar](100) NOT NULL,
	[ProdNum] [varchar](100) NOT NULL,
	[ProdDesc] [nvarchar](255) NOT NULL,
	[Count] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[MonthlyQty] [int] NOT NULL,
	[RequestedQty] [int] NOT NULL,
	[LastUpdated] [datetime] NULL,
	[NDC] [varchar](15) NULL,
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[ShipWeekOf] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NULL,
	[DateKey] [int] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Staging_FairShareProgram] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_Staging_FairshareProgram] UNIQUE NONCLUSTERED 
(
	[CustNum] ASC,
	[ProdNum] ASC,
	[BeginDate] ASC,
	[EndDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[FairShareProgram] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
