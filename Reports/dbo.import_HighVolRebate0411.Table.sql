USE [Reports]
GO
/****** Object:  Table [dbo].[import_HighVolRebate0411]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_HighVolRebate0411](
	[PMID] [nvarchar](255) NULL,
	[AAP Number] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
	[Current Estimated Avg Mo Volume from Audit] [money] NULL,
	[April API Volume] [money] NULL,
	[CAH Off Contract-LTC Volume] [money] NULL,
	[CAH AAP Net Sales] [money] NULL,
	[April Comb Volume] [money] NULL,
	[AAP Sales- COG Applied] [money] NULL,
	[AAP Brand RX Sales] [money] NULL,
	[Current CA COG] [float] NULL,
	[Base] [float] NULL,
	[Brand RX @ WAC] [money] NULL,
	[Brand RX Saved] [money] NULL,
	[High Volume Incentive] [money] NULL,
	[Total Saved] [money] NULL,
	[ECOG] [float] NULL,
	[COG Reduction] [float] NULL
) ON [PRIMARY]
GO
