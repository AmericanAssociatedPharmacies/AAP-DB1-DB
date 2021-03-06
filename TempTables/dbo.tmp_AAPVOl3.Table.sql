USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_AAPVOl3]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAPVOl3](
	[pmid] [int] NOT NULL,
	[TM#] [varchar](4) NULL,
	[AAP#] [varchar](20) NULL,
	[AAP Parent #] [varchar](20) NULL,
	[Affiliate Group] [varchar](125) NULL,
	[Pharmacy Name] [varchar](65) NULL,
	[Effective Date] [datetime] NULL,
	[Resigned Date] [datetime] NULL,
	[Jan 10 AAP] [float] NULL,
	[Jan 10 API] [float] NULL,
	[Jan 10 UD] [float] NULL,
	[Jan 10 CH Total] [float] NULL,
	[Jan 10 ML] [float] NULL,
	[Jan 10 Total] [float] NULL,
	[Feb 10 AAP] [float] NULL,
	[Feb 10 API] [float] NULL,
	[Feb 10 UD] [float] NULL,
	[Feb 10 CH Total] [float] NULL,
	[Feb 10 ML] [float] NULL,
	[Feb 10 Total] [float] NULL,
	[Mar 10 AAP] [float] NULL,
	[Mar 10 API] [float] NULL,
	[Mar 10 UD] [float] NULL,
	[Mar 10 CH Total] [float] NULL,
	[Mar 10 ML] [float] NULL,
	[Mar 10 Total] [float] NULL,
	[Apr 10 AAP] [float] NULL,
	[Apr 10 API] [float] NULL,
	[Apr 10 UD] [float] NULL,
	[Apr 10 CH Total] [float] NULL,
	[Apr 10 ML] [float] NULL,
	[Apr 10 Total] [float] NULL,
	[May 10 AAP] [float] NULL,
	[May 10 API] [float] NULL,
	[May 10 UD] [float] NULL,
	[May 10 CH Total] [float] NULL,
	[May 10 ML] [float] NULL,
	[May 10 Total] [float] NULL
) ON [PRIMARY]
GO
