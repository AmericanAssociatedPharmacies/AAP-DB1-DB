USE [WebDev]
GO
/****** Object:  Table [dbo].[PrimeDIRDetails]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrimeDIRDetails](
	[Parent Code] [nvarchar](50) NULL,
	[NCPDP] [nvarchar](50) NULL,
	[RxNbr] [nvarchar](50) NULL,
	[Submit Cost] [nvarchar](50) NULL,
	[Conc Fee] [numeric](18, 0) NULL,
	[Fill Date] [nvarchar](50) NULL,
	[NDC 1] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[Client] [nvarchar](50) NULL
) ON [PRIMARY]
GO
