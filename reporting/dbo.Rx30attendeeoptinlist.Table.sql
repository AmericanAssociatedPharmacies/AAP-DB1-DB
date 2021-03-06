USE [reporting]
GO
/****** Object:  Table [dbo].[Rx30attendeeoptinlist]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx30attendeeoptinlist](
	[Company] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[Email Address] [nvarchar](255) NULL,
	[Primary City] [nvarchar](255) NULL,
	[Primary State/Prov# Code] [nvarchar](255) NULL,
	[Primary State/Prov#] [nvarchar](255) NULL,
	[Primary Zip/Postal Code] [float] NULL,
	[Registration Type] [nvarchar](255) NULL,
	[Can we share your contact information with our Exhibitors/Sponso] [nvarchar](255) NULL,
	[Please select all that apply:] [nvarchar](255) NULL,
	[Please select whether you are a Prospect or Customer?] [nvarchar](255) NULL
) ON [PRIMARY]
GO
