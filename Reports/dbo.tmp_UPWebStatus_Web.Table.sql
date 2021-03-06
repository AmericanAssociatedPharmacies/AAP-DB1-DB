USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_UPWebStatus_Web]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_UPWebStatus_Web](
	[RequestID] [int] NULL,
	[NDC] [varchar](11) NULL,
	[BIN] [nvarchar](50) NULL,
	[PharmID] [nvarchar](50) NULL,
	[Emailed] [int] NULL,
	[OldPrice] [numeric](18, 4) NULL,
	[NewPrice] [numeric](18, 4) NULL,
	[Notes] [text] NULL,
	[CreatedOn] [smalldatetime] NULL,
	[UpdatedOn] [smalldatetime] NULL,
	[Status] [nvarchar](50) NULL,
	[Result] [nvarchar](100) NULL,
	[MacID] [int] NULL,
	[ActionID] [int] NULL,
	[ResultID] [int] NULL,
	[StatusID] [int] NULL,
	[Source] [int] NULL,
	[LinkID] [int] NOT NULL,
	[TrackID] [int] NULL,
	[PlanName] [nvarchar](200) NULL,
	[PlanKey] [nvarchar](50) NULL,
	[DrugName] [varchar](25) NULL,
	[RxNbr] [nvarchar](20) NULL,
	[RxDate] [smalldatetime] NULL,
	[NDC2] [varchar](11) NULL,
	[Qty] [int] NULL,
	[TotalPaid] [float] NULL,
	[TotalCost] [float] NULL,
	[GPI] [varchar](14) NULL,
	[CAHPriceStatus] [varchar](14) NOT NULL,
	[APIPriceStatus] [varchar](14) NOT NULL,
	[PatID] [nvarchar](50) NULL,
	[PCN] [nvarchar](50) NULL,
	[State] [varchar](2) NULL,
	[Expr1] [smalldatetime] NULL,
	[AccountName] [varchar](65) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
