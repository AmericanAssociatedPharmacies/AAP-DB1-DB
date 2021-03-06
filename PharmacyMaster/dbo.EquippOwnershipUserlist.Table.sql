USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[EquippOwnershipUserlist]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipUserlist](
	[Username] [float] NULL,
	[Password] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Level of Access] [float] NULL,
	[EQuIPP Group ID] [float] NULL
) ON [PRIMARY]
GO
