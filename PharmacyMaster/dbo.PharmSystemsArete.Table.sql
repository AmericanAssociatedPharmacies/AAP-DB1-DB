USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PharmSystemsArete]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmSystemsArete](
	[Software] [nvarchar](255) NULL,
	[parent] [varchar](255) NULL,
	[StoreCount] [int] NULL,
	[Company] [varchar](5) NOT NULL
) ON [PRIMARY]
GO
