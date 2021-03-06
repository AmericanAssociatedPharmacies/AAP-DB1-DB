USE [reporting]
GO
/****** Object:  Table [dbo].[temp_3858Relay_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_3858Relay_del](
	[NDC11] [nvarchar](50) NULL,
	[DrugName] [nvarchar](50) NULL,
	[Strength] [nvarchar](50) NULL,
	[BrandType] [nvarchar](50) NULL,
	[DAW] [nvarchar](50) NULL,
	[Whatever] [nvarchar](50) NULL,
	[DotNbr] [nvarchar](50) NULL,
	[TRxCount] [nvarchar](50) NULL,
	[TRxQtyDis] [nvarchar](50) NULL,
	[TotalAWP] [nvarchar](50) NULL,
	[PatientPaidAmount] [nvarchar](50) NULL,
	[TotalPaidAmount] [nvarchar](50) NULL,
	[DispensingFee] [nvarchar](50) NULL,
	[TotalIngCost] [nvarchar](50) NULL,
	[UCAmount] [nvarchar](50) NULL,
	[TableName] [nvarchar](50) NULL,
	[UnitPrice] [decimal](18, 4) NULL,
	[TotalWAC] [decimal](18, 4) NULL
) ON [PRIMARY]
GO
