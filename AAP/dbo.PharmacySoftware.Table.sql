USE [AAP]
GO
/****** Object:  Table [dbo].[PharmacySoftware]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacySoftware](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Abbreviation] [varchar](3) NOT NULL,
	[Description] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
