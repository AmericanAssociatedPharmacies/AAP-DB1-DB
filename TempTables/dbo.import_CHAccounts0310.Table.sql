USE [TempTables]
GO
/****** Object:  Table [dbo].[import_CHAccounts0310]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_CHAccounts0310](
	[contract] [varchar](5) NOT NULL,
	[Ship To Division] [float] NULL,
	[Ship To Division Name] [nvarchar](255) NULL,
	[Ship To Number] [nvarchar](255) NULL,
	[Ship To Name] [nvarchar](255) NULL,
	[Ship To Address 1] [nvarchar](255) NULL,
	[Ship To City] [nvarchar](255) NULL,
	[Ship To State] [nvarchar](255) NULL,
	[DEA Registration Number] [nvarchar](255) NULL,
	[Default Buy Plan %] [float] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[AR2000 Terms Code Description] [nvarchar](255) NULL,
	[Contract Group Number] [float] NULL,
	[Contract Group Effective Date] [datetime] NULL,
	[Actual WAPD 90 days] [float] NULL,
	[MMP DSO 90 days] [float] NULL
) ON [PRIMARY]
GO
