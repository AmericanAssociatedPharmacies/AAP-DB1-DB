USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_MCJul 2013]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MCJul 2013](
	[AAP #] [float] NULL,
	[Store Name] [nvarchar](255) NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[STATE] [nvarchar](255) NULL,
	[ZIP] [float] NULL,
	[AAP EFFECTIVE] [datetime] NULL,
	[F8] [nvarchar](255) NULL,
	[F9] [nvarchar](255) NULL,
	[F10] [nvarchar](255) NULL
) ON [PRIMARY]
GO
