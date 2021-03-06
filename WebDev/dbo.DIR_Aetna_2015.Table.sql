USE [WebDev]
GO
/****** Object:  Table [dbo].[DIR_Aetna_2015]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIR_Aetna_2015](
	[NCPDP] [nvarchar](50) NULL,
	[Plan PBM] [varchar](5) NOT NULL,
	[# of Claims] [int] NULL,
	[Per Claim] [varchar](4) NOT NULL,
	[Total] [numeric](14, 2) NULL,
	[Payment 1] [decimal](14, 2) NULL,
	[Payment 2] [varchar](30) NULL,
	[Payment 3] [varchar](30) NULL,
	[Payment 4] [varchar](30) NULL
) ON [PRIMARY]
GO
