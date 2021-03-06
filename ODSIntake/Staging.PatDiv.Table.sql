USE [ODSIntake]
GO
/****** Object:  Table [Staging].[PatDiv]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[PatDiv](
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
	[MC Contribution] [nvarchar](255) NULL,
	[ML Admin Fee] [nvarchar](255) NULL,
	[HIGH VOL INCENTIVE] [nvarchar](255) NULL,
	[AAP PVA Vol Admin Fee] [nvarchar](255) NULL,
	[AAP PVA Vol Admin Fee Retained] [nvarchar](255) NULL,
	[AAP PVA Gen Admin Fee] [nvarchar](255) NULL,
	[AAP PVA Gen Admin Fee Retained] [nvarchar](255) NULL,
	[Cardinal Annual Rebate] [nvarchar](255) NULL,
	[Subtotal Cardinal] [nvarchar](255) NULL,
	[Cardinal Upfront Admin] [nvarchar](255) NULL,
	[Cardinal HV Total] [nvarchar](255) NULL,
	[AAP Parent Contribution] [nvarchar](255) NULL,
	[WH Brand Year] [nvarchar](255) NULL,
	[WH Gen Year] [nvarchar](255) NULL,
	[WH Gen Contribution] [nvarchar](255) NULL,
	[WH OTC Year] [nvarchar](255) NULL,
	[MC, Cardinal and API Whse Contribution] [nvarchar](255) NULL,
	[Prelim Allocation] [nvarchar](255) NULL,
	[Under $15 deleted] [nvarchar](255) NULL,
	[Final Allocation] [nvarchar](255) NULL,
	[Half of Allocation] [nvarchar](255) NULL,
	[Payment Method] [nvarchar](255) NULL,
	[Check Process Charge] [float] NULL,
	[First Payment] [float] NULL,
	[Second Payment] [float] NULL,
	[Total to be paid] [float] NULL
) ON [PRIMARY]
GO
