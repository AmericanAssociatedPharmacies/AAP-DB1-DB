USE [TempTables]
GO
/****** Object:  Table [dbo].[HayesDir_Wayne]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesDir_Wayne](
	[Name] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[Mail] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Zip] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Fax] [varchar](255) NULL,
	[County] [varchar](255) NULL,
	[POP] [float] NULL,
	[Chain] [varchar](255) NULL,
	[Derived Column_CHQ] [varchar](255) NULL,
	[StoreNum] [varchar](255) NULL,
	[Branch] [varchar](255) NULL,
	[Other] [varchar](255) NULL,
	[FullState] [varchar](255) NULL
) ON [PRIMARY]
GO
