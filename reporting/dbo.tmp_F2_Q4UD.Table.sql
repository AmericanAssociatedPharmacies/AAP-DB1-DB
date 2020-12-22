USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_F2_Q4UD]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_F2_Q4UD](
	[UD_acct] [varchar](5) NULL,
	[UD_group] [varchar](25) NULL,
	[q4total] [numeric](16, 2) NULL,
	[q4average] [numeric](20, 6) NULL
) ON [PRIMARY]
GO
