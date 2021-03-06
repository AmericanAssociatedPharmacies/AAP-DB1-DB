USE [API]
GO
/****** Object:  Table [dbo].[CSOS_Warehouse]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSOS_Warehouse](
	[WarehouseId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[DeaNumber] [nvarchar](9) NULL,
	[ServiceContract] [nvarchar](45) NOT NULL,
	[LegissymFtpHost] [nvarchar](250) NULL,
	[LegisymFtpUser] [nvarchar](50) NULL,
	[LegisymFtpPW] [nvarchar](50) NULL,
	[LegisymSalesOrderFolder] [nvarchar](450) NULL,
	[LegisymErrMsgFolder] [nvarchar](450) NULL,
	[LegisymStockItemFolder] [nvarchar](450) NULL,
	[LegisymOrderDispositionFolder] [nvarchar](450) NULL,
 CONSTRAINT [PK_CSOS_Warehouse] PRIMARY KEY CLUSTERED 
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
