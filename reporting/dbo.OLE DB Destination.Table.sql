USE [reporting]
GO
/****** Object:  Table [dbo].[OLE DB Destination]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OLE DB Destination](
	[Parent] [nvarchar](255) NULL,
	[Aff#] [float] NULL,
	[DC] [float] NULL,
	[Acct#] [float] NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Master#] [float] NULL,
	[AAP Member Start Date] [datetime] NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Store#] [float] NULL,
	[DEA] [nvarchar](255) NULL,
	[DEA Exp] [datetime] NULL,
	[SBOP] [float] NULL,
	[SBOP Exp] [datetime] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[Date Documentation Sent to CCDB] [datetime] NULL,
	[New AAP Affiliation] [float] NULL,
	[New Rx COGs] [float] NULL,
	[New Store Number] [nvarchar](255) NULL,
	[Committed Volume] [money] NULL,
	[Terms] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL,
	[Name] [varchar](255) NULL,
	[Derived Column 1] [varchar](255) NULL
) ON [PRIMARY]
GO
