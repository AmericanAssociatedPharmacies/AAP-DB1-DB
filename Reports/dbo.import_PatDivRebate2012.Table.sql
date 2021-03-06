USE [Reports]
GO
/****** Object:  Table [dbo].[import_PatDivRebate2012]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_PatDivRebate2012](
	[PMID] [float] NULL,
	[AccountName] [nvarchar](255) NULL,
	[AAP Account No] [nvarchar](255) NULL,
	[AAP Parent No] [nvarchar](255) NULL,
	[UD Account No] [nvarchar](255) NULL,
	[API Account No] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[AAP Effective Date] [datetime] NULL,
	[AAP Quit Date] [datetime] NULL,
	[Is MC] [nvarchar](255) NULL,
	[MC Quit Date] [datetime] NULL,
	[MC During 2012] [nvarchar](255) NULL,
	[ML Admin Fee] [money] NULL,
	[Bashas Admin Fee] [money] NULL,
	[HIGH VOL INCENTIVE] [money] NULL,
	[AAP PVA Vol Admin Fee] [money] NULL,
	[AAP PVA Vol Admin Fee Retained] [money] NULL,
	[AAP PVA Gen Admin Fee] [money] NULL,
	[AAP PVA Gen Admin Fee Retained] [money] NULL,
	[Cardinal Annual Admin] [money] NULL,
	[Cardinal Upfront Admin Fee Alloc] [money] NULL,
	[Total Cardinal  and ML Admin Fees] [money] NULL,
	[MC only Total Cardinal and ML Fees] [money] NULL,
	[WH Brand 2012] [money] NULL,
	[WH Brand GP] [money] NULL,
	[WH Gen 2012] [money] NULL,
	[WH Gen GP] [money] NULL,
	[WH OTC 2012] [money] NULL,
	[WH OTC GP] [money] NULL,
	[Total WH GP] [money] NULL,
	[WH PD  Allocation] [money] NULL,
	[MC PD   Allocation] [money] NULL,
	[Remaining Allocation] [money] NULL,
	[Total Allocation] [money] NULL,
	[Total Alloc > $10] [money] NULL,
	[Patronage Dividends] [money] NULL,
	[Send April 15] [money] NULL,
	[Send July 15] [money] NULL
) ON [PRIMARY]
GO
