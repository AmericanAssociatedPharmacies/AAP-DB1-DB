USE [ODSIntake]
GO
/****** Object:  Table [dbo].[Reed_RBC]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reed_RBC](
	[Confirmation #] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[Guests] [nvarchar](255) NULL,
	[Registration Type] [nvarchar](255) NULL,
	[Primary Registrant Confirmation #] [nvarchar](255) NULL,
	[Confirmation #1] [nvarchar](255) NULL,
	[Email Address] [nvarchar](255) NULL,
	[CC Email Address] [nvarchar](255) NULL,
	[Account Number] [nvarchar](255) NULL,
	[Retail Independent Buying Group Name] [nvarchar](255) NULL,
	[Pharmacy/Store Name] [nvarchar](255) NULL,
	[DC#-Division] [nvarchar](255) NULL,
	[Region] [nvarchar](255) NULL,
	[Sales Rep Name/Number] [nvarchar](255) NULL,
	[Work Address] [nvarchar](255) NULL,
	[Work City] [nvarchar](255) NULL,
	[Work State/Prov# Code] [nvarchar](255) NULL,
	[Work Zip/Postal Code] [nvarchar](255) NULL,
	[Work Phone] [nvarchar](255) NULL,
	[Mobile Phone] [nvarchar](255) NULL,
	[Is this your first time attending RBC?] [nvarchar](255) NULL,
	[Please list your buying group affiliation:] [nvarchar](255) NULL,
	[Parent -Affilition] [nvarchar](255) NULL,
	[Child-Affiliation] [nvarchar](255) NULL
) ON [PRIMARY]
GO
