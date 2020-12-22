USE [ODSIntake]
GO
/****** Object:  Table [dbo].[Partners_20200206_New]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners_20200206_New](
	[VendorID] [float] NULL,
	[VendorName] [nvarchar](255) NULL,
	[RebateReportDisplayName] [nvarchar](255) NULL,
	[PPVendorID] [float] NULL,
	[Active] [float] NULL,
	[Comments] [nvarchar](255) NULL
) ON [PRIMARY]
GO
