USE [WebDev]
GO
/****** Object:  Table [dbo].[Advertisements]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisements](
	[advertisementID] [int] IDENTITY(1,1) NOT NULL,
	[advertisementLocationID] [int] NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
	[content] [text] NOT NULL,
	[isActive] [bit] NOT NULL,
	[name] [varchar](64) NULL,
 CONSTRAINT [PK__Advertis__4729E91504D0271E] PRIMARY KEY CLUSTERED 
(
	[advertisementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Advertisements]  WITH CHECK ADD  CONSTRAINT [FK_Advertisements_AdvertisementLocations] FOREIGN KEY([advertisementLocationID])
REFERENCES [dbo].[AdvertisementLocations] ([advertisementLocationID])
GO
ALTER TABLE [dbo].[Advertisements] CHECK CONSTRAINT [FK_Advertisements_AdvertisementLocations]
GO
