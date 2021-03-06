USE [Reports]
GO
/****** Object:  Table [dbo].[import_PatDivRebate2013]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_PatDivRebate2013](
	[PMID] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[AAP No#] [nvarchar](255) NULL,
	[Parent No#] [nvarchar](255) NULL,
	[UD No] [nvarchar](255) NULL,
	[API No#] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[AAPEffDate] [nvarchar](255) NULL,
	[AAP Quit] [nvarchar](255) NULL,
	[Is MC] [nvarchar](255) NULL,
	[MC Quit] [nvarchar](255) NULL,
	[MC in 2013] [nvarchar](255) NULL,
	[ML Adm Fee] [float] NULL,
	[Bashas Adm Fee] [float] NULL,
	[HV INCENTIVE] [float] NULL,
	[PVA Vol Adm Fee] [float] NULL,
	[PVA Vol Adm Fee Kept] [float] NULL,
	[PVA Gen Adm Fee] [float] NULL,
	[PVA Gen Adm Fee Kept] [float] NULL,
	[IPA Gen Adm Fee] [float] NULL,
	[Card Annual Rebate] [float] NULL,
	[Cardinal Upfront Admin] [float] NULL,
	[Total Cardinal and ML Admin] [float] NULL,
	[MC only Total Card & ML Adm] [float] NULL,
	[WH Brand 2013] [float] NULL,
	[WH Brand GP] [float] NULL,
	[WH Gen 2013] [float] NULL,
	[WH Gen GP] [float] NULL,
	[WH OTC 2013] [float] NULL,
	[WH OTC GP] [float] NULL,
	[Total WH GP] [float] NULL,
	[WH PD Alloc] [float] NULL,
	[MC PD Alloc] [float] NULL,
	[Remaining Alloc] [float] NULL,
	[Total Alloc] [float] NULL,
	[Total Alloc> $10] [float] NULL,
	[Patr Div] [float] NULL,
	[Send Apr 14] [money] NULL,
	[Send July 14] [money] NULL,
	[Total Patr Div] [money] NULL
) ON [PRIMARY]
GO
