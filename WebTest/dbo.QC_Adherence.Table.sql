USE [WebTest]
GO
/****** Object:  Table [dbo].[QC_Adherence]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QC_Adherence](
	[RxID] [int] NULL,
	[Pharm ID] [nvarchar](50) NULL,
	[BINNbr] [nvarchar](50) NULL,
	[PlanName] [nvarchar](200) NULL,
	[GPI] [varchar](14) NULL,
	[PatID] [nvarchar](50) NULL,
	[DrugName] [varchar](25) NULL,
	[Rx Nbr] [nvarchar](50) NULL,
	[LastFillDate] [datetime] NULL,
	[RefillsRemain] [int] NULL,
	[RefillNbr] [int] NULL,
	[DaysAfterLastRefill] [int] NULL,
	[DaySupply] [int] NULL,
	[NextFillDate] [datetime] NULL,
	[Category] [nvarchar](50) NULL
) ON [PRIMARY]
GO
