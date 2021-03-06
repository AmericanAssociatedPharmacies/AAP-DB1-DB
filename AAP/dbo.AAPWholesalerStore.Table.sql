USE [AAP]
GO
/****** Object:  Table [dbo].[AAPWholesalerStore]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPWholesalerStore](
	[AccountID] [int] NOT NULL,
	[WholesalerID] [int] NOT NULL,
	[WholesalerAcctNum] [varchar](32) NOT NULL,
	[DCNum] [int] NULL,
	[IsPrimaryWholesaler] [smallint] NULL,
	[AccountType] [varchar](10) NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_AAPWholesalerStore] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[WholesalerID] ASC,
	[WholesalerAcctNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
