USE [ODSIntake]
GO
/****** Object:  Table [dbo].['Corrected LaJolla']    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].['Corrected LaJolla'](
	[PMID] [nvarchar](255) NULL,
	[AAP Number] [nvarchar](255) NULL,
	[API acct] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
	[Multiple Store Code] [nvarchar](255) NULL,
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
	[Generic Source] [money] NULL,
	[1% Generic Admin] [money] NULL,
	[Incentive from AAP Net Sales] [money] NULL,
	[High Volume Incentive] [money] NULL,
	[Total Saved] [money] NULL,
	[ECOG] [float] NULL,
	[COG Reduction] [float] NULL,
	[A/P Terms] [nvarchar](255) NULL,
	[Group] [nvarchar](255) NULL,
	[Pay Y/N] [nvarchar](255) NULL,
	[DATE] [datetime] NULL
) ON [PRIMARY]
GO
