USE [WebTest]
GO
/****** Object:  Table [dbo].[DCPriceWeb]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DCPriceWeb](
	[NDC] [varchar](11) NULL,
	[Drugname] [varchar](25) NULL,
	[Grp#] [varchar](5) NULL,
	[Disp Fee] [numeric](3, 2) NULL,
	[Unit Ing.Cost] [float] NULL,
	[Reimbursement Indictor] [varchar](3) NOT NULL,
	[Brand] [varchar](9) NULL,
	[Non-MAC Generic] [varchar](10) NULL,
	[MAC] [varchar](65) NULL
) ON [PRIMARY]
GO
