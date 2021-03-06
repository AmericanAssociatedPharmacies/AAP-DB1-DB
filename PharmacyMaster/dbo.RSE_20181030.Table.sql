USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[RSE_20181030]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSE_20181030](
	[Month] [nvarchar](255) NULL,
	[Smn] [nvarchar](255) NULL,
	[PMID] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[NAME] [nvarchar](255) NULL,
	[Sales- COG Applied] [money] NULL,
	[Net Sales] [money] NULL,
	[Brand RX Sales] [money] NULL,
	[Total RX] [money] NULL,
	[Excluded from Total RX] [money] NULL,
	[COG Eligible Sales] [money] NULL,
	[Total Src Generics] [money] NULL,
	[OTC] [money] NULL,
	[Non RX- OTC & HH] [money] NULL,
	[Other] [money] NULL,
	[Group Source Compliance] [float] NULL
) ON [PRIMARY]
GO
