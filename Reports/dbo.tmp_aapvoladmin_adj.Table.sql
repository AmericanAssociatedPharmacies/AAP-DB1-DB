USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_aapvoladmin_adj]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_aapvoladmin_adj](
	[PMID] [nvarchar](255) NULL,
	[SumOfAAPVolumeAdminFee] [money] NULL,
	[AAPPVAVolAdmin] [money] NULL,
	[Adjustmenttomake] [money] NULL,
	[February] [money] NULL,
	[March] [money] NULL,
	[May] [money] NULL,
	[June] [money] NULL,
	[July] [money] NULL,
	[October] [money] NULL,
	[F11] [nvarchar](255) NULL,
	[F12] [nvarchar](255) NULL
) ON [PRIMARY]
GO
