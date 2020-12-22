USE [reporting]
GO
/****** Object:  Table [dbo].[CPay2012]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CPay2012](
	[PAYEE_ID] [varchar](6) NULL,
	[NCPDP] [varchar](7) NULL,
	[TOTAL] [float] NULL,
	[CHECK_NAME] [nvarchar](255) NULL
) ON [PRIMARY]
GO
