USE [Purchases]
GO
/****** Object:  Table [dbo].[NDC TABLE]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NDC TABLE](
	[brand] [nvarchar](50) NULL,
	[otc] [nvarchar](50) NULL,
	[card says OTC] [nvarchar](50) NULL,
	[dont carry at this time] [nvarchar](50) NULL,
	[generic] [nvarchar](50) NULL,
	[api carries] [nvarchar](50) NULL,
	[ndc] [nvarchar](50) NULL,
	[ndcdot] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[um] [nvarchar](50) NULL,
	[strength] [nvarchar](50) NULL,
	[gpi] [nvarchar](50) NULL,
	[size] [nvarchar](50) NULL,
	[size2] [nvarchar](50) NULL,
	[api  ] [nvarchar](50) NULL,
	[api desc] [nvarchar](50) NULL,
	[api mfg] [nvarchar](50) NULL,
	[api price] [nvarchar](50) NULL,
	[TMP SIZE] [nvarchar](50) NULL,
	[Mfg] [nvarchar](50) NULL,
	[MfgCode] [nvarchar](50) NULL,
	[scan code] [nvarchar](50) NULL,
	[cah desc] [nvarchar](50) NULL,
	[cah mfg] [nvarchar](50) NULL,
	[cah cin] [nvarchar](50) NULL,
	[cah size] [nvarchar](50) NULL,
	[cah contract] [nvarchar](50) NULL,
	[cah uoi] [nvarchar](50) NULL
) ON [PRIMARY]
GO
