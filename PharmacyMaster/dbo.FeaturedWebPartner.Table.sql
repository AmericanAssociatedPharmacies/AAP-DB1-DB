USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[FeaturedWebPartner]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeaturedWebPartner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartnerId] [int] NOT NULL,
	[ImageLink] [nvarchar](255) NOT NULL,
	[Link] [nvarchar](255) NULL,
	[FeatureDescription] [varchar](8000) NULL,
	[DateAdded] [datetime2](7) NOT NULL,
 CONSTRAINT [PK__Featured__3214EC0793D6848B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
