USE [API]
GO
/****** Object:  Table [dbo].[CSOS_SalesOrderFrmLegisym]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSOS_SalesOrderFrmLegisym](
	[SalesOrderFrmLegisymId] [bigint] IDENTITY(1,1) NOT NULL,
	[DatePrepared] [smalldatetime] NULL,
	[TimePrepared] [nvarchar](30) NULL,
	[System] [nvarchar](20) NULL,
	[Version] [nvarchar](20) NULL,
	[Express222OrderID] [int] NOT NULL,
	[ServiceContract] [nvarchar](45) NULL,
	[TransmissionCustomData] [nvarchar](500) NULL,
	[ProcessState] [nvarchar](30) NULL,
	[SupplierName] [varchar](50) NOT NULL,
	[SupplierAddress1] [varchar](255) NOT NULL,
	[SupplierAddress2] [varchar](255) NULL,
	[SupplierAddress3] [varchar](255) NULL,
	[SupplierCity] [varchar](255) NOT NULL,
	[SupplierState] [varchar](2) NOT NULL,
	[SupplierZip] [varchar](20) NOT NULL,
	[SupplierDeaNumber] [varchar](9) NOT NULL,
	[SupplierEmail] [varchar](150) NULL,
	[OrderActionType] [nvarchar](20) NULL,
	[Customer] [varchar](20) NOT NULL,
	[OrderDate] [smalldatetime] NOT NULL,
	[CustomerName] [varchar](75) NOT NULL,
	[CustomerDeaNumber] [varchar](9) NOT NULL,
	[UserID] [nvarchar](20) NULL,
	[UserName] [nvarchar](30) NULL,
	[ShipAddress1] [varchar](255) NOT NULL,
	[ShipAddress2] [varchar](255) NULL,
	[ShipAddress3] [varchar](255) NULL,
	[ShipAddress4] [varchar](255) NOT NULL,
	[ShipAddress5] [varchar](2) NOT NULL,
	[ShipPostalCode] [varchar](20) NOT NULL,
	[Email] [varchar](150) NULL,
	[Phone] [varchar](25) NULL,
	[CustomerOrderId] [varchar](20) NULL,
	[TrackingNumber] [varchar](9) NOT NULL,
	[SpecialInstructions] [nvarchar](500) NULL,
	[SignedDate] [datetime] NULL,
	[OrderHeaderCustomData] [nvarchar](500) NULL,
	[Status] [nvarchar](30) NULL,
	[CertValidationParameters] [nvarchar](250) NULL,
	[LegisymFileName] [nvarchar](350) NULL,
	[XmlFrmLegisym] [xml] NULL,
 CONSTRAINT [PK_CSOS_SalesOrdersFrmLegisym] PRIMARY KEY CLUSTERED 
(
	[SalesOrderFrmLegisymId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
