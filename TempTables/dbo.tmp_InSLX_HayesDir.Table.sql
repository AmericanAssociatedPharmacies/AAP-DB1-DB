USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_InSLX_HayesDir]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_InSLX_HayesDir](
	[Name] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[storenum] [varchar](255) NULL,
	[Account] [varchar](128) NULL,
	[City_SLX] [varchar](32) NULL,
	[State_SLX] [varchar](32) NULL,
	[MainPhone] [varchar](32) NULL
) ON [PRIMARY]
GO
