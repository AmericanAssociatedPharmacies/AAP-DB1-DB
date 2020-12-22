USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_F2_Q4UD_final]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_F2_Q4UD_final](
	[ud_acct] [varchar](5) NULL,
	[ud_group] [varchar](25) NULL,
	[memstore] [varchar](25) NULL,
	[q4UDtotal] [numeric](16, 2) NULL,
	[q4UDaverage] [numeric](20, 6) NULL,
	[q4UDgrptotal] [numeric](38, 2) NULL,
	[q4UDgrpaverage] [numeric](38, 6) NULL
) ON [PRIMARY]
GO
