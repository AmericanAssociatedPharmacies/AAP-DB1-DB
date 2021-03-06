USE [AAP]
GO
/****** Object:  Table [dbo].[API_WH_0909]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_WH_0909](
	[CUST STAT] [varchar](50) NULL,
	[Acct#] [varchar](50) NULL,
	[Name] [varchar](150) NULL,
	[DEA#] [varchar](50) NULL,
	[MEMNUM] [varchar](50) NULL,
	[Affiliated Grp] [varchar](50) NULL,
	[CA#] [varchar](50) NULL,
	[April Sales] [money] NULL,
	[May Sales] [money] NULL,
	[June Sales] [money] NULL,
	[July Sales] [money] NULL,
	[Aug Sales] [money] NULL,
	[Sept Sales] [money] NULL,
	[F15] [varchar](50) NULL
) ON [PRIMARY]
GO
