USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_vendorVList2_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_vendorVList2_del](
	[vendor_idV] [int] NULL,
	[vendor_idR] [int] NOT NULL,
	[vendor] [varchar](64) NULL
) ON [PRIMARY]
GO
