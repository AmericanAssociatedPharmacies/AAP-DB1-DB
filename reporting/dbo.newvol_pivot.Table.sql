USE [reporting]
GO
/****** Object:  Table [dbo].[newvol_pivot]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newvol_pivot](
	[acct_no] [varchar](4) NULL,
	[dt] [datetime] NULL,
	[vendor_id] [int] NULL,
	[volume] [numeric](14, 2) NULL
) ON [PRIMARY]
GO
