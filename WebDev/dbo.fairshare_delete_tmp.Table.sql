USE [WebDev]
GO
/****** Object:  Table [dbo].[fairshare_delete_tmp]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fairshare_delete_tmp](
	[CustNum] [nvarchar](255) NULL,
	[ProdNum] [nvarchar](255) NULL,
	[ProdDesc] [nvarchar](255) NULL,
	[Count] [float] NULL,
	[Price] [float] NULL,
	[Monthly Qty] [float] NULL,
	[Requested Qty] [nvarchar](255) NULL,
	[Start Date] [datetime] NULL,
	[End Date] [datetime] NULL,
	[Last Updated] [nvarchar](255) NULL,
	[NDC] [nvarchar](255) NULL,
	[Expiration Date] [nvarchar](255) NULL
) ON [PRIMARY]
GO
