USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[Equipp_Logins]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipp_Logins](
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[NPI] [nvarchar](50) NULL,
	[DistributionDate] [nvarchar](50) NULL
) ON [PRIMARY]
GO
