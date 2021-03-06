USE [ODSIntake]
GO
/****** Object:  Table [dbo].[HV_lovie_20200622]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HV_lovie_20200622](
	[PMID] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Month] [float] NULL,
	[1% Generic Admin] [money] NULL,
	[Incentive from AAP Net Sales] [money] NULL,
	[High Volume Incentive] [money] NULL,
	[Month1] [nvarchar](255) NULL,
	[1% Generic Admin1] [money] NULL,
	[Incentive from AAP Net Sales1] [money] NULL,
	[High Volume Incentive1] [money] NULL,
	[TOTAL DUE ACCOUNT ] [money] NULL
) ON [PRIMARY]
GO
