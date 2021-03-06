USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_TestSSIS]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_TestSSIS](
	[Change Type] [nvarchar](255) NULL,
	[General Description] [nvarchar](255) NULL,
	[Form] [nvarchar](255) NULL,
	[UM] [nvarchar](255) NULL,
	[Supplier] [nvarchar](255) NULL,
	[NDC] [float] NULL,
	[CIN] [float] NULL,
	[DP] [float] NULL,
	[Old Price] [money] NULL,
	[New Price] [money] NULL,
	[WAC] [money] NULL,
	[F12] [nvarchar](255) NULL,
	[Brand Name] [nvarchar](255) NULL,
	[Reason Code] [nvarchar](255) NULL,
	[Effect Dte] [datetime] NULL,
	[UOM] [nvarchar](255) NULL,
	[20% Increase] [nvarchar](255) NULL
) ON [PRIMARY]
GO
