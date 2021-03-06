USE [WebDev]
GO
/****** Object:  Table [dbo].[OthersS]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OthersS](
	[PMID] [int] NULL,
	[NPI] [nvarchar](max) NULL,
	[NCPDP] [nvarchar](max) NULL,
	[DBA] [nvarchar](max) NULL,
	[LTC] [nvarchar](max) NULL,
	[Inventory] [nvarchar](max) NULL,
	[Packaging] [nvarchar](max) NULL,
	[IV Medication] [nvarchar](max) NULL,
	[CompoundingS] [nvarchar](max) NULL,
	[On Call] [nvarchar](max) NULL,
	[Delivery] [nvarchar](max) NULL,
	[Emergency Boxes] [nvarchar](max) NULL,
	[Log Books] [nvarchar](max) NULL,
	[LIS] [nvarchar](max) NULL,
	[Immunization] [nvarchar](max) NULL,
	[MTM Mirixa] [nvarchar](max) NULL,
	[MTM Outcomes] [nvarchar](max) NULL,
	[MTM Catamaran] [nvarchar](max) NULL,
	[MTM Contact] [nvarchar](max) NULL,
	[PharmacyS Software System] [nvarchar](max) NULL,
	[Sell Products Outstate] [nvarchar](max) NULL,
	[Product Sales Detail] [nvarchar](max) NULL,
	[Employ Outstate] [nvarchar](max) NULL,
	[Out State Sales Detail] [nvarchar](max) NULL,
	[Incentive] [nvarchar](max) NULL,
	[Referals Detail] [nvarchar](max) NULL,
	[Have PTAN] [nvarchar](max) NULL,
	[PTAN] [nvarchar](max) NULL,
	[Pharmacist Prescribes] [nvarchar](max) NULL,
	[Have Medi-Cal number] [nvarchar](max) NULL,
	[Medi-Cal number] [nvarchar](max) NULL,
	[Reconciliation] [nvarchar](max) NULL,
	[Reconciliation Service] [nvarchar](max) NULL,
	[ADU] [nvarchar](max) NULL,
	[Refill website] [nvarchar](max) NULL,
	[Sterile] [nvarchar](max) NULL,
	[Sterile compliance number] [nvarchar](max) NULL,
	[Sterile compliance number expiry] [nvarchar](max) NULL,
	[NCPDP Dispenser Class] [nvarchar](max) NULL,
	[Specialize practice] [nvarchar](max) NULL,
	[Speciality Practice Area] [nvarchar](max) NULL,
	[Ebill] [nvarchar](max) NULL,
	[Balance bill] [nvarchar](max) NULL,
	[Sell spririted alcohol] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
