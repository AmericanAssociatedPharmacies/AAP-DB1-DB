USE [Purchases]
GO
/****** Object:  Table [dbo].[CHRebates]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHRebates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[PMID] [int] NULL,
	[NCPDP] [varchar](20) NULL,
	[CHRebatePerc] [float] NULL,
 CONSTRAINT [PK_CHRebates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
