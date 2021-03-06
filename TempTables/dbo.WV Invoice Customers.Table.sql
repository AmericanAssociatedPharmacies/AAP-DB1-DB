USE [TempTables]
GO
/****** Object:  Table [dbo].[WV Invoice Customers]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WV Invoice Customers](
	[CustNbr] [nvarchar](11) NULL,
	[Name] [nvarchar](30) NULL,
	[Address1] [nvarchar](35) NULL,
	[Address2] [nvarchar](35) NULL,
	[City] [nvarchar](35) NULL,
	[ST] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[Contact] [nvarchar](20) NULL
) ON [PRIMARY]
GO
