USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PP_20200303_InitialImport]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PP_20200303_InitialImport](
	[Preferred Partner] [nvarchar](255) NULL,
	[Admin Fee] [float] NULL,
	[Rebate] [float] NULL,
	[Total] [float] NULL
) ON [PRIMARY]
GO
