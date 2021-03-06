USE [WebDev]
GO
/****** Object:  Table [dbo].[DIRDetails_ESIMedicare]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRDetails_ESIMedicare](
	[nabp_nbr] [nvarchar](50) NULL,
	[PHARMACY NAME] [nvarchar](255) NULL,
	[corporate_name] [nvarchar](255) NULL,
	[Carrier] [nvarchar](255) NULL,
	[year_quarter] [nvarchar](50) NULL,
	[year_mo] [nvarchar](50) NULL,
	[GDR] [nvarchar](50) NULL,
	[Total_Claims] [nvarchar](50) NULL,
	[DIRFee] [nvarchar](50) NULL,
	[DIR 1Q2016] [nvarchar](50) NULL
) ON [PRIMARY]
GO
