USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_CAPurchaseQA]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CAPurchaseQA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceDate] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[DayOfWeek] [varchar](50) NULL,
	[Problem] [varchar](5000) NULL
) ON [PRIMARY]
GO
