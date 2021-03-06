USE [reporting]
GO
/****** Object:  Table [dbo].[AAP2017]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAP2017](
	[Opt-out 2016] [nvarchar](255) NULL,
	[PMID] [float] NULL,
	[AAPAccountNo] [float] NULL,
	[APIAccountNo] [float] NULL,
	[AAPParentNo] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](255) NULL,
	[BT_ID] [float] NULL,
	[co_id] [float] NULL,
	[ID] [float] NULL,
	[imis_First] [nvarchar](255) NULL,
	[iMIS_Last] [nvarchar](255) NULL,
	[AAP_First] [nvarchar](255) NULL,
	[AAP_Last] [nvarchar](255) NULL,
	[membertype] [nvarchar](255) NULL,
	[sourcecode] [nvarchar](255) NULL,
	[F16] [nvarchar](255) NULL,
	[Paid_Thru] [datetime] NULL,
	[PharmacyName] [nvarchar](255) NULL,
	[MailAddr1] [nvarchar](255) NULL,
	[MailAddr2] [nvarchar](255) NULL,
	[MailCity] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[MailZip] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[F25] [nvarchar](255) NULL
) ON [PRIMARY]
GO
