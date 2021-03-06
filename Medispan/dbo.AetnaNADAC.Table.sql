USE [Medispan]
GO
/****** Object:  Table [dbo].[AetnaNADAC]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AetnaNADAC](
	[NCPDP] [nvarchar](50) NULL,
	[Store Name] [nvarchar](200) NULL,
	[State] [nvarchar](50) NULL,
	[GPI] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[Drug Type] [nvarchar](50) NULL,
	[Drug Name] [nvarchar](200) NULL,
	[Pkg Size] [nvarchar](50) NULL,
	[Day Supply] [nvarchar](50) NULL,
	[AWP Discount] [nvarchar](50) NULL,
	[DF] [nvarchar](50) NULL,
	[Profit Script] [nvarchar](50) NULL,
	[GM%] [nvarchar](50) NULL,
	[Plan Name] [nvarchar](200) NULL,
	[BIN Nbr] [nvarchar](50) NULL,
	[PCN] [nvarchar](50) NULL,
	[Group Nbr] [nvarchar](50) NULL,
	[Rx Nbr] [nvarchar](50) NULL,
	[Rx Date] [nvarchar](50) NULL,
	[DAW] [nvarchar](50) NULL,
	[DAW Desc] [nvarchar](200) NULL,
	[U and C] [nvarchar](50) NULL,
	[FDB AWP] [nvarchar](50) NULL,
	[CoPay] [nvarchar](50) NULL,
	[Cost Submitted] [nvarchar](50) NULL,
	[Cost Paid] [nvarchar](50) NULL,
	[Qty Dispensed] [nvarchar](50) NULL,
	[MacPrice-Generics] [nvarchar](50) NULL,
	[Acquistion Cost] [nvarchar](50) NULL,
	[Total Paid Per Unit] [nvarchar](50) NULL,
	[TotalAcquisitionCost] [nvarchar](50) NULL,
	[Total Paid(Inc DF)] [nvarchar](50) NULL,
	[Profit Loss Unit] [nvarchar](50) NULL,
	[ReimbID] [nvarchar](50) NULL,
	[Column 34] [nvarchar](50) NULL
) ON [PRIMARY]
GO
