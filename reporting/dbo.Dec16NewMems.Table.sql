USE [reporting]
GO
/****** Object:  Table [dbo].[Dec16NewMems]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dec16NewMems](
	[Eff# Date] [datetime] NULL,
	[TM] [float] NULL,
	[AAP #] [float] NULL,
	[Store Name] [nvarchar](255) NULL,
	[City ] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[M or S] [nvarchar](255) NULL,
	[Average Mthly Vol] [float] NULL,
	[Whslr  (CAH    or ML)] [nvarchar](255) NULL,
	[*Exist, Comp or New] [nvarchar](255) NULL,
	[New Mem] [float] NULL,
	[Satellite Location] [float] NULL,
	[Existing PVA Customer] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[Exist API Whse Cust] [float] NULL,
	[New Whse] [float] NULL,
	[New MC] [float] NULL,
	[Change of ownership] [float] NULL,
	[Notes] [nvarchar](255) NULL,
	[F20] [nvarchar](255) NULL,
	[TM Cold Call] [float] NULL,
	[CAH Rep] [float] NULL,
	[Web Inquiry] [nvarchar](255) NULL,
	[Phone In Inquiry] [nvarchar](255) NULL,
	[Current WH Cust ] [float] NULL,
	[Mem Referral ] [float] NULL,
	[Identiiy…] [nvarchar](255) NULL
) ON [PRIMARY]
GO
