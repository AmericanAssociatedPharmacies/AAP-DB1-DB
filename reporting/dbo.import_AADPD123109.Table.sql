USE [reporting]
GO
/****** Object:  Table [dbo].[import_AADPD123109]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_AADPD123109](
	[UD #] [nvarchar](255) NULL,
	[Wholesaler] [nvarchar](255) NULL,
	[Volume] [money] NULL,
	[Rebate] [money] NULL,
	[Basis Points] [float] NULL,
	[PMID] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [nvarchar](255) NULL,
	[Months Paid For] [float] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL
) ON [PRIMARY]
GO
