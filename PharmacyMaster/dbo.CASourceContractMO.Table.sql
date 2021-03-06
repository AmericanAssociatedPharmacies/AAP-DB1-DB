USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[CASourceContractMO]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CASourceContractMO](
	[Date] [datetime] NULL,
	[ChangeType] [varchar](255) NULL,
	[Description] [varchar](255) NULL,
	[Form] [varchar](255) NULL,
	[UM] [varchar](255) NULL,
	[Supplier] [varchar](255) NULL,
	[NDC] [varchar](50) NULL,
	[CIN] [float] NULL,
	[DP] [float] NULL,
	[OldPrice] [money] NULL,
	[NewPrice] [money] NULL,
	[WAC] [money] NULL,
	[F12] [varchar](50) NULL,
	[BrandName] [nvarchar](255) NULL,
	[ReasonCode] [nvarchar](255) NULL,
	[EffectDte] [datetime] NULL,
	[UOM] [nvarchar](255) NULL,
	[20Percent] [nvarchar](255) NULL
) ON [PRIMARY]
GO
