USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_UpdateMason2013]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_UpdateMason2013](
	[AccountName] [nvarchar](255) NULL,
	[AccountNumber] [float] NULL,
	[DC] [float] NULL,
	[Units] [float] NULL,
	[Sales] [money] NULL,
	[Rebate] [money] NULL
) ON [PRIMARY]
GO
