USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[EquippUserList]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserList](
	[New Username] [nvarchar](255) NULL,
	[Initial Password] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[ProfDesignation] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Level of Access/NPI] [float] NULL,
	[Start Date] [datetime] NULL,
	[EQuIPP Group ID] [float] NULL
) ON [PRIMARY]
GO
