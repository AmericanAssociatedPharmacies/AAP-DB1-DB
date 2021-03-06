USE [WebTest]
GO
/****** Object:  Table [dbo].[OthersAll]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OthersAll](
	[PMID] [int] NULL,
	[NPI] [nvarchar](500) NULL,
	[NCPDP] [nvarchar](500) NULL,
	[DBA] [nvarchar](500) NULL,
	[LTC] [nvarchar](500) NULL,
	[Inventory] [nvarchar](500) NULL,
	[Packaging] [nvarchar](500) NULL,
	[IV Medication] [nvarchar](500) NULL,
	[Compounding] [nvarchar](500) NULL,
	[On Call] [nvarchar](500) NULL,
	[Delivery] [nvarchar](500) NULL,
	[Emergency Boxes] [nvarchar](500) NULL,
	[Log Books] [nvarchar](500) NULL,
	[LIS] [nvarchar](500) NULL,
	[Immunization] [nvarchar](500) NULL,
	[MTM Mirixa] [nvarchar](500) NULL,
	[MTM Outcomes] [nvarchar](500) NULL,
	[MTM Catamaran] [nvarchar](500) NULL,
	[MTM Contact] [nvarchar](500) NULL,
	[Pharmacy Software System] [nvarchar](500) NULL,
	[Sell Products Outstate] [nvarchar](500) NULL,
	[Product Sales Detail] [nvarchar](500) NULL,
	[Employ Outstate] [nvarchar](500) NULL,
	[Out State Sales Detail] [nvarchar](500) NULL,
	[Incentive] [nvarchar](500) NULL,
	[Referals Detail] [nvarchar](500) NULL,
	[Have PTAN] [nvarchar](500) NULL,
	[PTAN] [nvarchar](500) NULL,
	[Pharmacist Prescribes] [nvarchar](500) NULL,
	[Have Medi-Cal number] [nvarchar](500) NULL,
	[Medi-Cal number] [nvarchar](500) NULL,
	[Reconciliation] [nvarchar](500) NULL,
	[Reconciliation Service] [nvarchar](500) NULL,
	[ADU] [nvarchar](500) NULL,
	[Refill website] [nvarchar](500) NULL,
	[Sterile] [nvarchar](500) NULL,
	[Sterile compliance number] [nvarchar](500) NULL,
	[Sterile compliance number expiry] [nvarchar](500) NULL,
	[NCPDP Dispenser Class] [nvarchar](500) NULL,
	[Specialize practice] [nvarchar](500) NULL,
	[Speciality Practice Area] [nvarchar](500) NULL,
	[Ebill] [nvarchar](500) NULL,
	[Balance bill] [nvarchar](500) NULL,
	[Sell spirited alcohol] [nvarchar](500) NULL
) ON [PRIMARY]
GO
