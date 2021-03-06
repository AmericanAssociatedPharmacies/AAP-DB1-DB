USE [API]
GO
/****** Object:  Table [dbo].[CSOS_OrderDispositionFrmAPI]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSOS_OrderDispositionFrmAPI](
	[OrderDispositionFrmAPIId] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemaVersion] [nvarchar](35) NULL,
	[DatePreparedStr] [nvarchar](25) NULL,
	[DatePrepared] [smalldatetime] NULL,
	[TimePrepared] [nvarchar](25) NULL,
	[ServiceContract] [nvarchar](45) NULL,
	[Express222OrderId] [int] NOT NULL,
	[TrackingNumber] [nvarchar](15) NULL,
	[LineId] [int] NULL,
	[DispositionDateStr] [nvarchar](25) NULL,
	[DispositionDate] [smalldatetime] NULL,
	[DispositionType] [nvarchar](25) NULL,
	[Quantity] [int] NULL,
	[StockCode] [nvarchar](20) NULL,
	[NdcNumber] [nvarchar](11) NULL,
	[Status] [nvarchar](30) NULL,
	[XmlToLegisym] [xml] NULL,
 CONSTRAINT [PK_CSOSOrderDispositionFrmAPI] PRIMARY KEY CLUSTERED 
(
	[OrderDispositionFrmAPIId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
