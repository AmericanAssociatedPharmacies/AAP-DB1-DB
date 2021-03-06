USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[TimeZoneZipCode]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeZoneZipCode](
	[City] [nvarchar](50) NULL,
	[ST] [nvarchar](50) NULL,
	[ZIP] [nvarchar](50) NULL,
	[A C] [nvarchar](50) NULL,
	[FIPS] [nvarchar](50) NULL,
	[County] [nvarchar](50) NULL,
	[Pref?] [nvarchar](50) NULL,
	[T Z] [nvarchar](50) NULL,
	[DST?] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL
) ON [PRIMARY]
GO
