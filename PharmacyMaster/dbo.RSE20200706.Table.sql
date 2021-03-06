USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[RSE20200706]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSE20200706](
	[Acct#] [nvarchar](255) NULL,
	[BUSCLS] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[Cust NAME] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Smn] [nvarchar](255) NULL,
	[Total Generics Sales] [money] NULL,
	[Elig Generics for Rebate] [money] NULL,
	[Generic Loyalty Rebate] [money] NULL,
	[1st Payment Negative Rebates collected] [money] NULL,
	[1st Payment Collect FC] [money] NULL,
	[First Payment Amt] [money] NULL,
	[Check Fee First Payment] [money] NULL,
	[Net Payment First Payment] [money] NULL,
	[Pay Account First Payment] [bit] NULL,
	[A/P Payment Mode First Payment] [nvarchar](255) NULL,
	[BUSCLS Second Payment] [nvarchar](255) NULL,
	[Affiliate Second Payment] [nvarchar](255) NULL,
	[Second Payment Amt] [money] NULL,
	[Check Fee Second Payment] [money] NULL,
	[2nd Payment Collect Negative Rebate] [money] NULL,
	[2nd Payment Collect FC] [money] NULL,
	[Net Payment Second Payment] [money] NULL,
	[Pay Account Second Payment] [bit] NULL,
	[A/P Payment Mode Second Payment] [nvarchar](255) NULL
) ON [PRIMARY]
GO
