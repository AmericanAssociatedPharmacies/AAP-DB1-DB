USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_CalStoresJulie]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CalStoresJulie](
	[Cust #] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Address 2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State, Zip] [nvarchar](255) NULL,
	[State Lic #] [nvarchar](255) NULL,
	[Sate Lic Exp.] [datetime] NULL
) ON [PRIMARY]
GO
