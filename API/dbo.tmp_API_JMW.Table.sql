USE [API]
GO
/****** Object:  Table [dbo].[tmp_API_JMW]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_JMW](
	[Salesman] [nvarchar](50) NULL,
	[CustName] [nvarchar](100) NULL,
	[CustNum] [nvarchar](50) NULL,
	[Brand] [numeric](18, 2) NULL,
	[Generic] [numeric](18, 2) NULL,
	[OTC] [numeric](18, 2) NULL,
	[Total] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
