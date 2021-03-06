USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_okdelete_scott052510]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_okdelete_scott052510](
	[Pharmacy] [nvarchar](255) NULL,
	[NABP] [nvarchar](255) NULL,
	[Card Acct Num] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[PMID] [numeric](29, 0) NULL,
	[AAPID] [numeric](29, 0) NULL,
	[API Account] [nvarchar](255) NULL,
	[Territory] [nvarchar](255) NULL,
	[Vendor Name] [nvarchar](255) NULL,
	[Generic Name] [nvarchar](255) NULL,
	[Trade Name] [nvarchar](255) NULL,
	[CIN] [float] NULL,
	[NDC] [nvarchar](255) NULL,
	[Strength] [nvarchar](255) NULL,
	[Form] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[UD] [nvarchar](255) NULL,
	[Vendor Abbr] [nvarchar](255) NULL,
	[Base Cost] [money] NULL,
	[Units] [float] NULL,
	[Dollars] [money] NULL,
	[MS % Cust#] [float] NULL,
	[MS % Total] [float] NULL
) ON [PRIMARY]
GO
