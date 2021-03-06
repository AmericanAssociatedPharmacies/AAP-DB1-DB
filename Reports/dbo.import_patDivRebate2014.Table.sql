USE [Reports]
GO
/****** Object:  Table [dbo].[import_patDivRebate2014]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_patDivRebate2014](
	[PMID] [float] NULL,
	[AccountName] [nvarchar](255) NULL,
	[AAP Num] [nvarchar](255) NULL,
	[AAP Parent] [nvarchar](255) NULL,
	[UD no] [nvarchar](255) NULL,
	[APIAccountNo] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[AAPEffectiveDate] [nvarchar](255) NULL,
	[AAPQuitDate] [nvarchar](255) NULL,
	[Is MC] [nvarchar](255) NULL,
	[MCQuitDate] [nvarchar](255) NULL,
	[MC contribution] [money] NULL,
	[ML Admin Fee] [money] NULL,
	[HIGH VOL INCENTIVE] [money] NULL,
	[AAP PVA Vol Admin Fee] [money] NULL,
	[AAP PVA Vol Admin Fee Retained] [money] NULL,
	[AAP PVA Gen Admin Fee] [money] NULL,
	[AAP PVA Gen Admin Fee Retained] [money] NULL,
	[Cardinal Annual Rebate] [money] NULL,
	[Subtotal Cardinal] [money] NULL,
	[Cardinal Upfront Admin] [money] NULL,
	[Cardinal, HV Total] [money] NULL,
	[AAP parent contribution] [money] NULL,
	[WH Brand 2014] [money] NULL,
	[WH Gen 2014] [money] NULL,
	[WH Gen contribution] [money] NULL,
	[WH OTC 2014] [money] NULL,
	[MC, Cardinal and API whse Contribution] [money] NULL,
	[Prelim Allocation] [money] NULL,
	[Under $15 deleted] [money] NULL,
	[Final Allocation] [money] NULL,
	[Half of Allocation] [money] NULL,
	[Pmt Method] [nvarchar](255) NULL,
	[Ck Process Charge] [money] NULL,
	[Net to be paid Apr 8] [money] NULL,
	[Half to be paid Aug 5] [money] NULL,
	[Total to be paid] [money] NULL
) ON [PRIMARY]
GO
