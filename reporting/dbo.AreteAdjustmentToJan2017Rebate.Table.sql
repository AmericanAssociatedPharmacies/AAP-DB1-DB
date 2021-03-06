USE [reporting]
GO
/****** Object:  Table [dbo].[AreteAdjustmentToJan2017Rebate]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AreteAdjustmentToJan2017Rebate](
	[PMID] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[Original Arete Eligible] [bit] NOT NULL,
	[Original Arete Performance Rebate] [money] NULL,
	[Revised Arete Eligible] [bit] NOT NULL,
	[Revised Arete Rebate] [money] NULL,
	[Amount to Claw Back] [money] NULL
) ON [PRIMARY]
GO
