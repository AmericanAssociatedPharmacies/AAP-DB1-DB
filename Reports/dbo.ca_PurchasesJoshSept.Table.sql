USE [Reports]
GO
/****** Object:  Table [dbo].[ca_PurchasesJoshSept]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ca_PurchasesJoshSept](
	[CustomerUnique] [nvarchar](255) NULL,
	[L01 Afltn Name] [nvarchar](255) NULL,
	[Distribution Center Number] [float] NULL,
	[CustomerNumber] [varchar](50) NULL,
	[CustomerName] [nvarchar](255) NULL,
	[Corporate Item Number] [float] NULL,
	[Description] [varchar](255) NULL,
	[NDC] [varchar](50) NULL,
	[Supplier] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[OldSell] [money] NULL,
	[NewSell] [money] NULL,
	[PercChange] [float] NULL,
	[ProtectionStartDate] [datetime] NULL,
	[ProtectionEndDate] [datetime] NULL,
	[UnitSellDlr] [money] NULL,
	[TotalSeptPurchases] [float] NULL,
	[9/3/2014] [nvarchar](255) NULL,
	[9/4/2014] [nvarchar](255) NULL,
	[9/5/2014] [float] NULL,
	[9/6/2014] [nvarchar](255) NULL,
	[9/8/2014] [float] NULL,
	[9/9/2014] [nvarchar](255) NULL,
	[9/10/2014] [nvarchar](255) NULL,
	[9/11/2014] [float] NULL,
	[9/12/2014] [float] NULL,
	[9/13/2014] [nvarchar](255) NULL,
	[9/15/2014] [float] NULL,
	[9/16/2014] [nvarchar](255) NULL,
	[9/17/2014] [nvarchar](255) NULL,
	[9/18/2014] [nvarchar](255) NULL,
	[9/19/2014] [float] NULL,
	[9/20/2014] [float] NULL,
	[9/22/2014] [nvarchar](255) NULL,
	[9/23/2014] [nvarchar](255) NULL,
	[9/24/2014] [nvarchar](255) NULL,
	[9/25/2014] [nvarchar](255) NULL,
	[9/26/2014] [nvarchar](255) NULL,
	[9/27/2014] [float] NULL,
	[9/29/2014] [nvarchar](255) NULL,
	[9/30/2014] [float] NULL,
	[F42] [nvarchar](255) NULL,
	[F43] [nvarchar](255) NULL
) ON [PRIMARY]
GO
