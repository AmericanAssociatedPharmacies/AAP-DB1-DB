USE [reporting]
GO
/****** Object:  Table [dbo].[AdamsPharmOrderHistory_1stQtr]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdamsPharmOrderHistory_1stQtr](
	[ACCT#] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[DESC] [nvarchar](255) NULL,
	[Class] [nvarchar](255) NULL,
	[SHP] [float] NULL,
	[INV#] [float] NULL,
	[Date] [datetime] NULL,
	[NDC] [nvarchar](255) NULL
) ON [PRIMARY]
GO
