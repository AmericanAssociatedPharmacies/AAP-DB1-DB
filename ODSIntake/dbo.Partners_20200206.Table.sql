USE [ODSIntake]
GO
/****** Object:  Table [dbo].[Partners_20200206]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners_20200206](
	[VendorID] [int] NOT NULL,
	[VendorName] [nvarchar](255) NULL,
	[RebateReportDisplayName] [nvarchar](255) NULL,
	[PPVendorID] [nvarchar](255) NULL,
	[Active] [float] NULL,
	[Comments] [nvarchar](255) NULL,
 CONSTRAINT [CPK1_20200206] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
