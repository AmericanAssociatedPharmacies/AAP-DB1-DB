USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[pm_geocode_tpn]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_geocode_tpn](
	[pmid] [int] NOT NULL,
	[GAddress] [varchar](255) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[Updated] [datetime] NULL,
	[pm_address_type] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
