USE [Reports]
GO
/****** Object:  Table [dbo].[donna_delete3]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[donna_delete3](
	[NDC11] [nvarchar](50) NULL,
	[Drug Name] [nvarchar](50) NULL,
	[Strength] [nvarchar](50) NULL,
	[Brand Type] [nvarchar](50) NULL,
	[DAW] [nvarchar](50) NULL,
	[Column 5] [nvarchar](50) NULL,
	[Dot Nbr] [nvarchar](50) NULL,
	[Metrics] [nvarchar](50) NULL,
	[TRx Count] [decimal](29, 0) NULL,
	[TRx Quantity Dispensed] [decimal](29, 0) NULL,
	[Total  AWP] [decimal](29, 0) NULL,
	[Patient Paid Amount] [decimal](29, 0) NULL,
	[Total Paid Amount] [decimal](29, 0) NULL,
	[Dispensing Fee Amount] [decimal](29, 0) NULL,
	[Total Ingredient Cost] [decimal](29, 0) NULL,
	[Usual Customary Amount] [decimal](29, 0) NULL
) ON [PRIMARY]
GO
