USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_delete_TrueCal2010YTD_CAS_v1]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_TrueCal2010YTD_CAS_v1](
	[Cal_Year] [varchar](4) NOT NULL,
	[acct_no] [varchar](5) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL,
	[january] [int] NULL,
	[february] [int] NULL,
	[march] [int] NULL,
	[april] [numeric](38, 2) NULL,
	[may] [numeric](38, 2) NULL,
	[june] [numeric](38, 2) NULL,
	[1Q10Paid] [bit] NULL,
	[2Q10Paid] [bit] NULL
) ON [PRIMARY]
GO
