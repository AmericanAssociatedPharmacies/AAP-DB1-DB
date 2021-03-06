USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_CHDivisions]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHDivisions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DivNo] [varchar](10) NULL,
	[DivName] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](10) NULL,
	[Zip] [varchar](10) NULL,
	[Phone] [varchar](25) NULL,
	[Fax] [varchar](25) NULL,
 CONSTRAINT [PK_PM_CHDivisions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
