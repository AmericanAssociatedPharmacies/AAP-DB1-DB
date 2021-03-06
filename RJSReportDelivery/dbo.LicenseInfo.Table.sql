USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[LicenseInfo]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicenseInfo](
	[LicenseKey] [varchar](40) NOT NULL,
	[LicenseIPAddress] [varchar](50) NOT NULL,
	[LicenseHostName] [varchar](255) NOT NULL,
	[LicenseKeyDesc] [varchar](30) NOT NULL,
	[LicenseKeyValue] [varchar](2048) NOT NULL,
	[LicenseMisc1] [varchar](255) NOT NULL,
	[LicenseMisc2] [varchar](255) NOT NULL,
	[LicenseMisc3] [varchar](244) NOT NULL,
 CONSTRAINT [PK_LICENSEINFO] PRIMARY KEY CLUSTERED 
(
	[LicenseKey] ASC,
	[LicenseIPAddress] ASC,
	[LicenseHostName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
