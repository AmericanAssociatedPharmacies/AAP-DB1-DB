USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_UPAutoStatusCurr]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_UPAutoStatusCurr](
	[RequestID] [int] NULL,
	[NDC] [nvarchar](20) NULL,
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
	[RxNbr] [nvarchar](50) NULL,
	[RxDate] [datetime] NULL,
	[Qty] [numeric](38, 3) NULL,
	[TotalPaid] [numeric](38, 3) NULL,
	[GPI] [varchar](14) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
