USE [Reports]
GO
/****** Object:  Table [dbo].[import_PlanogramRebate2010]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_PlanogramRebate2010](
	[Issue Check] [bit] NOT NULL,
	[Affiliate] [nvarchar](255) NULL,
	[PMID] [nvarchar](255) NULL,
	[AAPParentNo] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[ContactFullName] [nvarchar](255) NULL,
	[Addr1] [nvarchar](255) NULL,
	[Addr2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Rebate] [float] NULL,
	[AAP Meeting Attendee] [bit] NOT NULL
) ON [PRIMARY]
GO
