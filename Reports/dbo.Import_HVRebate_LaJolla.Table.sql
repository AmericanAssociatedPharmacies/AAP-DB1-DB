USE [Reports]
GO
/****** Object:  Table [dbo].[Import_HVRebate_LaJolla]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import_HVRebate_LaJolla](
	[Date] [datetime] NULL,
	[PMID] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[API acct] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
	[Current Est Mo Sales] [money] NULL,
	[Mo API Volume] [money] NULL,
	[CAH off Contract-LTC Volume] [money] NULL,
	[AAP Net Sales] [money] NULL,
	[Mo Comb Volume] [money] NULL,
	[AAP Sales- COG Applied] [money] NULL,
	[AAP Brand RX Sales] [money] NULL,
	[Current CA COG] [float] NULL,
	[Base] [float] NULL,
	[Brand RX@WAC] [money] NULL,
	[Brand RX Saved] [money] NULL,
	[High Volume Incentive] [money] NULL,
	[Total Saved] [money] NULL,
	[ECOG] [float] NULL,
	[COG Reduction] [float] NULL,
	[Generic Source] [money] NULL,
	[1% Generic Admin] [money] NULL,
	[Incentive from AAP Net Sales] [money] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Group] [nvarchar](255) NULL
) ON [PRIMARY]
GO
