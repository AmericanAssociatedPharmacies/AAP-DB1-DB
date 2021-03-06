USE [ODSIntake]
GO
/****** Object:  Table [Staging].[APIInvoiceImport]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APIInvoiceImport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Invoice] [varchar](500) NULL,
	[OrderNbr] [varchar](500) NULL,
	[Date] [varchar](500) NULL,
	[APICustNbr] [varchar](500) NULL,
	[APICustName] [varchar](500) NULL,
	[CarrierCode] [varchar](500) NULL,
	[CarrierDesc] [varchar](500) NULL,
	[CustRef] [varchar](500) NULL,
	[Whse] [varchar](500) NULL,
	[OrdType] [varchar](500) NULL,
	[DateLoaded] [datetime] NOT NULL,
	[FileProcessed] [varchar](1000) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[ROWVERSIONID] [timestamp] NOT NULL,
 CONSTRAINT [PK_APISalesInvoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[APIInvoiceImport] ADD  DEFAULT (getdate()) FOR [DateLoaded]
GO
ALTER TABLE [Staging].[APIInvoiceImport] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
