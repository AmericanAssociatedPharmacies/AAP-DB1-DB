USE [MedispanImages]
GO
/****** Object:  Table [dbo].[IM2DMFG_M]    Script Date: 12/22/2020 4:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IM2DMFG_M](
	[Manufacturer_ID] [numeric](19, 0) NOT NULL,
	[Transaction_Code] [nvarchar](1) NULL,
	[Manufacturer_Name] [nvarchar](30) NULL,
	[Reserve] [nvarchar](39) NULL,
PRIMARY KEY CLUSTERED 
(
	[Manufacturer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
