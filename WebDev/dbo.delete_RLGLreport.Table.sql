USE [WebDev]
GO
/****** Object:  Table [dbo].[delete_RLGLreport]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_RLGLreport](
	[Date] [datetime] NULL,
	[Login] [nvarchar](50) NULL,
	[Logintype] [nvarchar](50) NULL,
	[NCPDP] [nvarchar](50) NULL,
	[Rx] [nvarchar](50) NULL,
	[RxDate] [nvarchar](50) NULL,
	[Result] [nvarchar](50) NULL
) ON [PRIMARY]
GO
