USE [AAP]
GO
/****** Object:  Table [dbo].[Geocode]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Geocode](
	[GeocodeID] [int] IDENTITY(1,1) NOT NULL,
	[AAPID] [bigint] NULL,
	[UDID] [varchar](4) NULL,
	[GoogleAddress] [varchar](255) NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[Updated] [datetime] NOT NULL,
	[Name] [varchar](255) NULL,
	[APIID] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[MasterID] [int] NULL
) ON [PRIMARY]
GO
