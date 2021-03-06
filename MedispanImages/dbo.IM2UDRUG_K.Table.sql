USE [MedispanImages]
GO
/****** Object:  Table [dbo].[IM2UDRUG_K]    Script Date: 12/22/2020 4:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IM2UDRUG_K](
	[Unique_Drug_ID] [numeric](19, 0) NOT NULL,
	[Transaction_Code] [nvarchar](1) NULL,
	[Dosage_Form_ID] [int] NULL,
	[External_Drug_ID] [nvarchar](20) NULL,
	[Manufacturer_ID] [bigint] NULL,
	[Reserve] [nvarchar](26) NULL,
PRIMARY KEY CLUSTERED 
(
	[Unique_Drug_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
