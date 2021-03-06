USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PharmacyPending]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacyPending](
	[Pharmacy DBA Name] [nvarchar](200) NULL,
	[Store] [nvarchar](50) NULL,
	[NCPDP ID] [nvarchar](50) NULL,
	[NPI] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Main Phone] [nvarchar](50) NULL,
	[Change] [nvarchar](50) NULL,
	[Submitted] [nvarchar](50) NULL
) ON [PRIMARY]
GO
