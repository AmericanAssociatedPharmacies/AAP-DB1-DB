USE [reporting]
GO
/****** Object:  Table [dbo].[volvndrs050608_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[volvndrs050608_del](
	[ACTIVE?] [bit] NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [nvarchar](25) NULL,
	[FOOTNOTE] [nvarchar](35) NULL,
	[EFFECTDATE] [datetime] NULL,
	[FACTOR] [float] NULL,
	[REPORTS] [nvarchar](1) NULL,
	[TOTAL PERCENT REBATE] [real] NULL,
	[ACTIVE2007] [bit] NULL,
	[VENDORPAIR] [int] NULL
) ON [PRIMARY]
GO
