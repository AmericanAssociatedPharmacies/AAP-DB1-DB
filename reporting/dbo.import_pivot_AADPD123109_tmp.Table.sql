USE [reporting]
GO
/****** Object:  Table [dbo].[import_pivot_AADPD123109_tmp]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_pivot_AADPD123109_tmp](
	[pmid] [nvarchar](255) NULL,
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
	[Months Paid For] [float] NULL
) ON [PRIMARY]
GO
