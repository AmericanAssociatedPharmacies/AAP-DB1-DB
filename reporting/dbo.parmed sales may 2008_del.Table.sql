USE [reporting]
GO
/****** Object:  Table [dbo].[parmed sales may 2008_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parmed sales may 2008_del](
	[UD Acct #] [nvarchar](50) NULL,
	[Segment] [nvarchar](50) NULL,
	[ParMed #] [nvarchar](50) NULL,
	[Customer Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[2nd Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Total Sales] [numeric](15, 2) NULL
) ON [PRIMARY]
GO
