USE [reporting]
GO
/****** Object:  Table [dbo].[temp_COG_COMPARE]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_COG_COMPARE](
	[AFF Primary] [nvarchar](50) NULL,
	[Ship To Division] [nvarchar](50) NULL,
	[Ship To Number] [nvarchar](50) NULL,
	[Ship To Name] [nvarchar](50) NULL,
	[Ship To Address 1] [nvarchar](50) NULL,
	[Ship To City] [nvarchar](50) NULL,
	[Ship To State] [nvarchar](50) NULL,
	[Ship To Postal Code] [nvarchar](50) NULL,
	[Store Number] [nvarchar](50) NULL,
	[COG%] [nvarchar](50) NULL,
	[AR2000 Terms Code] [nvarchar](50) NULL,
	[Statement Frequency] [nvarchar](50) NULL,
	[March 2009 Total Sales] [nvarchar](50) NULL,
	[February 2009 Total Sales] [nvarchar](50) NULL,
	[January 2009 Total Sales] [nvarchar](50) NULL,
	[March 2009 Total RX] [nvarchar](50) NULL,
	[February 2009 Total RX] [nvarchar](50) NULL,
	[January 2009 Total RX] [nvarchar](50) NULL,
	[March 2009 RX Brand] [nvarchar](50) NULL,
	[February 2009 RX Brand] [nvarchar](50) NULL,
	[January 2009 RX Brand] [nvarchar](50) NULL,
	[March 2009 Total Generics] [nvarchar](50) NULL,
	[February 2009 Total Generics] [nvarchar](50) NULL,
	[January 2009 Total Generics] [nvarchar](50) NULL,
	[March 2009 Source Generics] [nvarchar](50) NULL,
	[February 2009 Source Generic] [nvarchar](50) NULL,
	[January 2009 Source Generic] [nvarchar](50) NULL,
	[March 2009 OTC Cog Applied] [nvarchar](50) NULL,
	[February 2009 OTC Cog Applied] [nvarchar](50) NULL,
	[January 2009 OTC Cog Applied] [nvarchar](50) NULL
) ON [PRIMARY]
GO
