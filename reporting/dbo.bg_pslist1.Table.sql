USE [reporting]
GO
/****** Object:  Table [dbo].[bg_pslist1]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bg_pslist1](
	[Chain] [nvarchar](255) NULL,
	[Drug] [nvarchar](255) NULL,
	[Quantity] [float] NULL,
	[Price] [float] NULL,
	[DrugComp] [varchar](255) NULL
) ON [PRIMARY]
GO
