USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_slximport2]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_slximport2](
	[accountid] [nvarchar](50) NULL,
	[udacctno] [nvarchar](50) NULL,
	[monthvolumeavg] [numeric](38, 2) NOT NULL
) ON [PRIMARY]
GO
