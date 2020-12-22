USE [Purchases]
GO
/****** Object:  Table [dbo].[CAHInvoiceDetailAZ]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAHInvoiceDetailAZ](
	[AZMaxRowversionID] [varchar](25) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CAHInvoiceDetailAZ] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
