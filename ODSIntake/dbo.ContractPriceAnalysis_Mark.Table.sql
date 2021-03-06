USE [ODSIntake]
GO
/****** Object:  Table [dbo].[ContractPriceAnalysis_Mark]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractPriceAnalysis_Mark](
	[CIN] [float] NULL,
	[NDC] [nvarchar](255) NULL,
	[GPI] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Supplier Name] [nvarchar](255) NULL,
	[Strength] [nvarchar](255) NULL,
	[Accunet Size] [float] NULL,
	[UOM] [nvarchar](255) NULL,
	[Form] [nvarchar](255) NULL,
	[Form Description] [nvarchar](255) NULL,
	[AAP CONTRACT PRICE] [money] NULL,
	[Lowest GPI Price  ] [money] NULL,
	[Contract] [varchar](20) NULL,
	[PPP CONTRACT PRICE] [float] NULL,
	[Generic Name] [nvarchar](255) NULL,
	[Brand Name] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[Formulary Name] [nvarchar](255) NULL,
	[END_DTE] [datetime] NULL
) ON [PRIMARY]
GO
