USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_AAPVOl]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAPVOl](
	[pmid] [int] NOT NULL,
	[TM#] [varchar](4) NULL,
	[AAP#] [varchar](20) NULL,
	[AAP Parent #] [varchar](20) NULL,
	[Affiliate Group] [varchar](125) NULL,
	[Pharmacy Name] [varchar](65) NULL,
	[Effective Date] [datetime] NULL,
	[Jan 10 Sales AAP PVA] [float] NULL,
	[Jan 10 Sales API PVA] [float] NULL,
	[Jan 10 Sales UD PVA] [float] NULL,
	[Jan 10 Sales CH Total] [float] NULL,
	[Jan 10 Sales ML] [float] NULL,
	[Jan 10 Sales Total] [float] NULL,
	[Feb 10 Sales AAP PVA] [float] NULL,
	[Feb 10 Sales API PVA] [float] NULL,
	[Feb 10 Sales UD PVA] [float] NULL,
	[Feb 10 Sales CH Total] [float] NULL,
	[Feb 10 Sales ML] [float] NULL,
	[Feb 10 Sales Total] [float] NULL,
	[Mar 10 Sales AAP PVA] [float] NULL,
	[Mar 10 Sales API PVA] [float] NULL,
	[Mar 10 Sales UD PVA] [float] NULL,
	[Mar 10 Sales  CH Total] [float] NULL,
	[Mar 10 Sales ML] [float] NULL,
	[Mar 10 Sales Total] [float] NULL,
	[Apr 10 Sales AAP PVA] [float] NULL,
	[Apr 10 Sales API PVA] [float] NULL,
	[Apr 10 Sales UD PVA] [float] NULL,
	[Apr 10 Sales  CH Total] [float] NULL,
	[Apr 10 Sales ML] [float] NULL,
	[Apr 10 Sales Total] [float] NULL,
	[May 10 Sales AAP PVA] [float] NULL,
	[May 10 Sales API PVA] [float] NULL,
	[May 10 Sales UD PVA] [float] NULL,
	[May 10 Sales  CH Total] [float] NULL,
	[May 10 Sales ML] [float] NULL,
	[May 10 Sales Total] [float] NULL
) ON [PRIMARY]
GO
