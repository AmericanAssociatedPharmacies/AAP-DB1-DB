USE [reporting]
GO
/****** Object:  Table [dbo].[import_merge_PD123109]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_merge_PD123109](
	[PPMID] [nvarchar](255) NULL,
	[PMID1] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Date of Membership] [datetime] NULL,
	[Termination of Membership] [nvarchar](255) NULL,
	[Volume Included] [nvarchar](255) NULL,
	[Bs Cls] [nvarchar](255) NULL,
	[Cardinal Total Purchases] [money] NULL,
	[Volume Admin Fee] [money] NULL,
	[Validate Admin fee] [float] NULL,
	[Cardinal Source Purchases] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[Validate Generic Admin] [float] NULL,
	[Brand RX- warehouse] [money] NULL,
	[Brand Rx-Brincr] [money] NULL,
	[Gross Margin on brand] [money] NULL,
	[Validate GM on Brand] [float] NULL,
	[Generics- warehouse] [money] NULL,
	[Gross Margin on generics] [money] NULL,
	[Validate GM on Generics] [float] NULL,
	[Brand Credits Pd-Neg] [money] NULL,
	[Total Contribution API] [money] NULL,
	[PMID2] [nvarchar](255) NULL,
	[ud #] [nvarchar](255) NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [nvarchar](255) NULL,
	[VolumeCH] [numeric](19, 4) NULL,
	[RebateCH] [numeric](19, 4) NULL,
	[BasisPointsCH] [float] NULL,
	[VolumeML] [numeric](19, 4) NULL,
	[RebateML] [numeric](19, 4) NULL,
	[BasisPointsML] [float] NULL,
	[Months Paid For] [float] NULL,
	[AVolumeTotalAAD] [numeric](20, 4) NULL,
	[RebateTotalAAD] [numeric](20, 4) NULL,
	[RebatePaidAAD] [float] NULL,
	[TotalContributionAll] [float] NULL,
	[factor] [float] NULL,
	[PDividend] [float] NULL
) ON [PRIMARY]
GO
