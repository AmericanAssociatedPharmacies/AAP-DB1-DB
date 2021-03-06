USE [WebTest]
GO
/****** Object:  Table [dbo].[PPItems]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPItems](
	[CIN] [varchar](50) NULL,
	[Description] [varchar](255) NULL,
	[NDC] [varchar](50) NULL,
	[Supplier] [varchar](50) NULL,
	[Size] [varchar](255) NULL,
	[ProtectedSellPrice] [money] NULL,
	[NewSellPrice] [money] NULL,
	[ProtectionStartDate] [datetime] NULL,
	[ProtectionEndDate] [datetime] NULL,
	[PIPSavings] [money] NULL
) ON [PRIMARY]
GO
