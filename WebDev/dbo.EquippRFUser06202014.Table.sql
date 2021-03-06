USE [WebDev]
GO
/****** Object:  Table [dbo].[EquippRFUser06202014]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippRFUser06202014](
	[New Username] [nvarchar](50) NULL,
	[Initial Password] [nvarchar](50) NULL,
	[First Name] [nvarchar](50) NULL,
	[Last Name] [nvarchar](50) NULL,
	[ProfDesignation] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](50) NULL,
	[Level of Access NPI] [nvarchar](50) NULL,
	[Notes] [nvarchar](200) NULL
) ON [PRIMARY]
GO
