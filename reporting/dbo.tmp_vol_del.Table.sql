USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_vol_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_vol_del](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TABLE_TYPE] [varchar](50) NULL,
	[YEAR] [int] NOT NULL,
	[STORE] [varchar](50) NOT NULL,
	[JANUARY] [float] NULL,
	[FEBRUARY] [float] NULL,
	[MARCH] [float] NULL,
	[APRIL] [float] NULL,
	[MAY] [float] NULL,
	[JUNE] [float] NULL,
	[JULY] [float] NULL,
	[AUGUST] [float] NULL,
	[SEPTEMBER] [float] NULL,
	[OCTOBER] [float] NULL,
	[NOVEMBER] [float] NULL,
	[DECEMBER] [float] NULL
) ON [PRIMARY]
GO
