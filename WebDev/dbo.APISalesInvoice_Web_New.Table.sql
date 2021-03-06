USE [WebDev]
GO
/****** Object:  Table [dbo].[APISalesInvoice_Web_New]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesInvoice_Web_New](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountid] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvDate] [datetime] NULL,
	[OrderNbr] [varchar](15) NULL,
	[CarrierCode] [varchar](15) NULL,
	[CarrierDesc] [varchar](255) NULL,
	[Whsnum] [varchar](2) NULL,
	[Whsname] [varchar](10) NOT NULL,
	[RowVersionID] [timestamp] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[APISalesInvoice_Web_New] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
