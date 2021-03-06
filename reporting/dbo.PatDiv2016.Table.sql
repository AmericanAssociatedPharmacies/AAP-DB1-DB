USE [reporting]
GO
/****** Object:  Table [dbo].[PatDiv2016]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatDiv2016](
	[PMID] [float] NULL,
	[AccountName] [nvarchar](255) NULL,
	[AAPAccountNo] [nvarchar](255) NULL,
	[AAPParentNo] [nvarchar](255) NULL,
	[UDNo] [nvarchar](255) NULL,
	[APIAccountNo] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[AAPEffectiveDate] [nvarchar](255) NULL,
	[AAPQuitDate] [nvarchar](255) NULL,
	[Is MC] [nvarchar](255) NULL,
	[MCQuitDate] [nvarchar](255) NULL,
	[MC Contribution] [float] NULL,
	[ML Admin Fee] [float] NULL,
	[HIGH VOL INCENTIVE] [nvarchar](255) NULL,
	[AAP PVA Vol Admin Fee] [float] NULL,
	[AAP PVA Vol Admin Fee Retained] [float] NULL,
	[AAP PVA Gen Admin Fee] [float] NULL,
	[AAP PVA Gen Admin Fee Retained] [float] NULL,
	[Cardinal Annual Rebate] [float] NULL,
	[Subtotal Cardinal] [float] NULL,
	[Cardinal Upfront Admin] [float] NULL,
	[Cardinal, HV Total] [float] NULL,
	[AAP Parent Contribution] [float] NULL,
	[WH Brand Year] [float] NULL,
	[WH Gen Year] [float] NULL,
	[WH Gen Contribution] [float] NULL,
	[WH OTC Year] [float] NULL,
	[MC, Cardinal and API Whse Contribution] [float] NULL,
	[Prelim Allocation] [float] NULL,
	[Under $15 deleted] [float] NULL,
	[Final Allocation] [float] NULL,
	[Half of Allocation] [float] NULL,
	[Payment Method] [nvarchar](255) NULL,
	[Check Process Charge] [float] NULL,
	[First Payment] [float] NULL,
	[Second Payment] [float] NULL,
	[Total to be paid] [float] NULL
) ON [PRIMARY]
GO
