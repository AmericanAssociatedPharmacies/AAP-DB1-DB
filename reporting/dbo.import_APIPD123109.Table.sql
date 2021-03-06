USE [reporting]
GO
/****** Object:  Table [dbo].[import_APIPD123109]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_APIPD123109](
	[PMID] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Date of Membership] [datetime] NULL,
	[Termination of Membership] [nvarchar](255) NULL,
	[Volume Included] [nvarchar](255) NULL,
	[Bs Cls] [nvarchar](255) NULL,
	[Cardinal Total Purchases] [money] NULL,
	[Volume Admin Fee] [money] NULL,
	[Validate Admin fee] [float] NULL,
	[Cardinal Source Purchases] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[Validate Generic Admin] [float] NULL,
	[Brand RX- warehouse] [money] NULL,
	[Brand RX (Less brincr)] [money] NULL,
	[Gross Margin on brand] [money] NULL,
	[Validate GM on Brand] [float] NULL,
	[Generics- warehouse] [money] NULL,
	[Gross Margin on generics] [money] NULL,
	[Validate GM on Generics] [float] NULL,
	[Brand Credits Pd-Neg] [money] NULL,
	[Total Contribution] [money] NULL
) ON [PRIMARY]
GO
