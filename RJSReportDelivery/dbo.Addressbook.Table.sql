USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[Addressbook]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addressbook](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressEmail] [varchar](255) NULL,
	[AddressName] [varchar](100) NULL,
	[AddressCompany] [varchar](100) NULL,
	[AddressPhone] [varchar](30) NULL,
	[AddressFax] [varchar](30) NULL,
	[AddressLine1] [varchar](50) NULL,
	[AddressLine2] [varchar](50) NULL,
	[AddressCity] [varchar](50) NULL,
	[AddressState] [varchar](10) NULL,
	[AddressZip] [varchar](20) NULL,
	[AddressCountry] [varchar](50) NULL,
	[AddressMisc1] [varchar](100) NULL,
	[AddressMisc2] [varchar](100) NULL,
	[AddressMisc3] [varchar](100) NULL,
	[AddressActivate] [varchar](3) NOT NULL,
 CONSTRAINT [PK__ADDRESSBOOK__023D5A04] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
