USE [reporting]
GO
/****** Object:  Table [dbo].[cas_vndvolrebate]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cas_vndvolrebate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NULL,
	[PMID] [int] NULL,
	[UDNo] [varchar](50) NULL,
	[StoreName] [nvarchar](100) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[AccruedStartdt] [smalldatetime] NULL,
	[AccruedEnddt] [smalldatetime] NULL,
	[FileID] [int] NULL,
	[TransactionID] [int] NULL
) ON [PRIMARY]
GO
