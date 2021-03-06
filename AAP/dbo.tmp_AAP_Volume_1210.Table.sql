USE [AAP]
GO
/****** Object:  Table [dbo].[tmp_AAP_Volume_1210]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAP_Volume_1210](
	[storename] [varchar](65) NULL,
	[aapaccountno] [varchar](20) NULL,
	[apiaccountno] [varchar](20) NULL,
	[udaccountno] [varchar](20) NULL,
	[city] [varchar](25) NULL,
	[state] [varchar](2) NULL,
	[effectiveaap] [datetime] NULL,
	[CH AAP December] [float] NULL,
	[CH UD December] [float] NULL,
	[CH API November] [numeric](18, 2) NULL,
	[API Sales December] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
