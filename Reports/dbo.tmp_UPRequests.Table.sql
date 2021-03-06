USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_UPRequests]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_UPRequests](
	[RequestID] [int] NOT NULL,
	[BIN] [nvarchar](10) NULL,
	[Group] [nvarchar](50) NULL,
	[PatName] [nvarchar](100) NULL,
	[PatID] [nvarchar](50) NULL,
	[PatDOB] [smalldatetime] NULL,
	[Wholesaler] [nvarchar](100) NULL,
	[NDC] [varchar](8000) NULL,
	[FillDate] [smalldatetime] NULL,
	[Quantity] [int] NULL,
	[RxNbr] [nvarchar](20) NULL,
	[TotalCost] [float] NULL,
	[TotalPaid] [float] NULL,
	[Maced] [bit] NULL,
	[NCPDP] [nvarchar](20) NULL,
	[ContactName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Fax] [nvarchar](20) NULL,
	[Notes] [text] NULL,
	[CreatedOn] [smalldatetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[AccountName] [varchar](65) NULL,
	[SendPBM] [int] NULL,
	[ChainCode] [int] NULL,
	[GPI] [varchar](14) NULL,
	[DrugName] [varchar](25) NULL,
	[TMFirstName] [varchar](35) NULL,
	[TMLastName] [varchar](35) NULL,
	[TM] [varchar](4) NULL,
	[DrugType] [varchar](50) NULL,
	[RxOTC] [varchar](3) NULL,
	[Strength] [numeric](13, 5) NULL,
	[DrugTypeShort] [varchar](3) NULL,
	[PlanName] [nvarchar](200) NULL,
	[GPIDesc] [varchar](60) NULL,
	[Form] [varchar](4) NULL,
	[DaySupply] [nvarchar](20) NULL,
	[PCN] [nvarchar](50) NULL,
	[Invoice] [int] NULL,
	[PMID] [int] NULL,
	[APIAccountNo] [varchar](1) NOT NULL,
	[AWP] [numeric](13, 5) NULL,
	[PS] [numeric](8, 3) NULL,
	[Unit] [varchar](2) NULL,
	[DispensingFee] [float] NULL,
	[Compound] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
