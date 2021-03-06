USE [WebTest]
GO
/****** Object:  Table [dbo].[UPStatus]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPStatus](
	[PharmID] [nvarchar](50) NULL,
	[BIN] [nvarchar](50) NULL,
	[PlanName] [nvarchar](200) NULL,
	[NDC] [nvarchar](20) NULL,
	[RxNbr] [nvarchar](50) NULL,
	[RxDate] [datetime] NULL,
	[DrugName] [varchar](25) NULL,
	[Result] [nvarchar](100) NULL,
	[Status] [nvarchar](50) NULL,
	[Source] [varchar](18) NOT NULL,
	[CreatedOn] [smalldatetime] NULL,
	[CAHPriceStatus] [varchar](14) NOT NULL,
	[APIPriceStatus] [varchar](14) NOT NULL,
	[UpdatedOn] [smalldatetime] NULL,
	[Notes] [nvarchar](255) NULL
) ON [PRIMARY]
GO
