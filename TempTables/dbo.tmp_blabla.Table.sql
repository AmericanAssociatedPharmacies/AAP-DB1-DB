USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_blabla]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_blabla](
	[Account Code (Contact.BusinessAccount.AccountCode)] [nvarchar](255) NULL,
	[Account Name (Contact.BusinessAccount.AccountName)] [varchar](128) NULL,
	[Title (Contact.Contact0100)] [varchar](64) NULL,
	[Salutation (Contact.SalutationId)] [varchar](256) NULL,
	[First Name (Contact.FirstName)] [varchar](256) NULL,
	[Last Name (Contact.LastName)] [varchar](256) NULL,
	[Primary Contact (Contact.Primary)] [varchar](5) NOT NULL,
	[Description (Contact.Address.Description)] [varchar](64) NULL,
	[Primary Address (Contact.Address.DefaultAddress)] [varchar](5) NOT NULL,
	[Street 1 (Contact.Address.Street1)] [varchar](64) NULL,
	[Street 2 (Contact.Address.Street2)] [varchar](64) NULL,
	[City (Contact.Address.City)] [varchar](32) NULL,
	[State/Province (Contact.Address.StateProvinceId)] [varchar](32) NULL,
	[Country (Contact.Address.CountryId)] [varchar](256) NULL,
	[Zip/PostCode (Contact.Address.Zip)] [varchar](24) NULL,
	[Phone Number (Contact.BusinessPhoneTypeNav.PhoneNumber)] [varchar](256) NULL,
	[Phone Number (Contact.Business2PhoneTypeNav.PhoneNumber)] [varchar](256) NULL,
	[Phone Number (Contact.FaxPhoneTypeNav.PhoneNumber)] [varchar](256) NULL,
	[Phone Number (Contact.HomePhoneTypeNav.PhoneNumber)] [varchar](256) NULL,
	[Phone Number (Contact.MobilePhoneTypeNav.PhoneNumber)] [varchar](256) NULL,
	[Email Address (Contact.Contact0103)] [varchar](128) NULL,
	[Rank] [bigint] NULL
) ON [PRIMARY]
GO
