USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_aapgenadmin_adj_bkp]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_aapgenadmin_adj_bkp](
	[PMID] [nvarchar](255) NULL,
	[SumOfEstGenericAdminFee] [money] NULL,
	[AAPPVAGenAdmin] [float] NULL,
	[AdjustmentsToMake] [money] NULL,
	[February] [money] NULL,
	[March] [money] NULL,
	[April] [money] NULL,
	[May] [money] NULL,
	[June] [money] NULL,
	[July] [money] NULL,
	[October] [money] NULL,
	[TOTAL] [money] NULL,
	[F13] [nvarchar](255) NULL,
	[F14] [nvarchar](255) NULL
) ON [PRIMARY]
GO
