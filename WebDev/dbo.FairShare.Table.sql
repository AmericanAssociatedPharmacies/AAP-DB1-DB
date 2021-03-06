USE [WebDev]
GO
/****** Object:  Table [dbo].[FairShare]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FairShare](
	[CustNum] [nvarchar](255) NULL,
	[ProdNum] [nvarchar](255) NULL,
	[ProdDesc] [nvarchar](255) NULL,
	[Count] [float] NULL,
	[Price] [float] NULL,
	[Monthly Qty] [float] NULL,
	[Requested Qty] [float] NULL,
	[Start Date] [datetime] NULL,
	[End Date] [datetime] NULL,
	[Last Updated] [datetime] NULL,
	[NDC] [varchar](15) NULL,
	[Expiration Date] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FairShare] ADD  CONSTRAINT [DF_FairShare_Last Updated]  DEFAULT (getdate()) FOR [Last Updated]
GO
