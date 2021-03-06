USE [TempTables]
GO
/****** Object:  Table [dbo].[delete_postcard5]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_postcard5](
	[pmid] [int] NULL,
	[AAP] [varchar](20) NULL,
	[apiaccountno] [varchar](20) NULL,
	[MC] [varchar](1) NOT NULL,
	[ncpdp] [nvarchar](7) NULL,
	[npi] [nvarchar](10) NULL,
	[name_ncpdp] [nvarchar](60) NULL,
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip9] [nvarchar](255) NULL,
	[Zip5] [nvarchar](255) NULL,
	[phonef] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[phone2f] [nvarchar](255) NULL,
	[phone2] [nvarchar](255) NULL,
	[County] [nvarchar](255) NULL,
	[SMSA] [float] NULL,
	[Type] [nvarchar](255) NULL,
	[YN] [nvarchar](255) NULL,
	[ID] [nvarchar](255) NULL,
	[F16] [nvarchar](255) NULL,
	[F17] [nvarchar](255) NULL,
	[F18] [nvarchar](255) NULL,
	[F19] [nvarchar](255) NULL,
	[F20] [nvarchar](255) NULL,
	[F21] [nvarchar](255) NULL,
	[F22] [nvarchar](255) NULL,
	[F23] [nvarchar](255) NULL,
	[F24] [nvarchar](255) NULL,
	[F25] [nvarchar](255) NULL,
	[key] [nvarchar](265) NULL
) ON [PRIMARY]
GO
