USE [reporting]
GO
/****** Object:  Table [dbo].[pivot_AADPD123109]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pivot_AADPD123109](
	[PMID] [nvarchar](255) NULL,
	[UD #] [float] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [nvarchar](255) NULL,
	[UDQuit] [nvarchar](255) NULL,
	[Months Paid For] [float] NULL,
	[VolumeCH] [int] NOT NULL,
	[RebateCH] [int] NOT NULL,
	[BasisPointsCH] [int] NOT NULL,
	[VolumeML] [int] NOT NULL,
	[RebateML] [int] NOT NULL,
	[BasisPointsML] [int] NOT NULL
) ON [PRIMARY]
GO
