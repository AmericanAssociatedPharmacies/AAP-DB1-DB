USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PPRebates_Vendors_JMW]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPRebates_Vendors_JMW](
	[Vendor ID] [int] NULL,
	[Store Name] [varchar](65) NULL,
	[Contact] [varchar](255) NULL,
	[Store Address – Line 1] [varchar](100) NULL,
	[Store Address – Line 2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Corporate Name] [varchar](100) NULL,
	[Remit to Address – Line 1] [varchar](100) NULL,
	[Remit to Address – Line 2] [varchar](100) NULL,
	[Remit to City] [varchar](50) NULL,
	[Remit to State] [varchar](2) NULL,
	[Remit to Zip] [varchar](50) NULL,
	[Payment Address Type] [varchar](10) NOT NULL,
	[1099 Type] [int] NOT NULL,
	[Telephone 1] [varchar](50) NULL,
	[Fax Number] [varchar](50) NULL,
	[Vendor E-mail] [varchar](255) NULL,
	[GLExpenseAccount] [varchar](7) NOT NULL,
	[Tax ID Number] [varchar](12) NULL,
	[Territory] [varchar](4) NULL
) ON [PRIMARY]
GO
