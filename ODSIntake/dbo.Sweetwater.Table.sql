USE [ODSIntake]
GO
/****** Object:  Table [dbo].[Sweetwater]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sweetwater](
	[Invoice Date] [nvarchar](255) NULL,
	[Invoice_Due Date] [nvarchar](255) NULL,
	[Invoice #] [float] NULL,
	[NDC] [nvarchar](255) NULL,
	[PO #] [nvarchar](255) NULL,
	[Trade Name] [nvarchar](255) NULL,
	[Generic Name] [nvarchar](255) NULL,
	[Package Size] [nvarchar](255) NULL,
	[Package U/M] [nvarchar](255) NULL,
	[Unit Cost] [money] NULL,
	[Order Qty] [float] NULL,
	[Ship Qty] [float] NULL,
	[Return Qty] [float] NULL,
	[Dollars] [money] NULL
) ON [PRIMARY]
GO
