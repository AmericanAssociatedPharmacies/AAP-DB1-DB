USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_UD_ML_AdminNew]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_UD_ML_AdminNew](
	[PMID] [int] NOT NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountno] [varchar](20) NULL,
	[UD Admin Fee] [numeric](38, 2) NULL,
	[ML Admin Fee] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
