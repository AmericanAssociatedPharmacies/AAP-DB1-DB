USE [WebTest]
GO
/****** Object:  Table [dbo].[DCPRiceRX05]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DCPRiceRX05](
	[NDC] [varchar](11) NULL,
	[AWP] [numeric](13, 5) NULL,
	[DrugName] [varchar](25) NULL,
	[Reimbursement Indictor] [varchar](5) NOT NULL
) ON [PRIMARY]
GO
