USE [WebDev]
GO
/****** Object:  Table [dbo].[AdvertisementLocations]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertisementLocations](
	[advertisementLocationID] [int] IDENTITY(1,1) NOT NULL,
	[location] [varchar](64) NOT NULL,
 CONSTRAINT [PK__Advertis__0B5CE25CE572B0FC] PRIMARY KEY CLUSTERED 
(
	[advertisementLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
