USE [reporting]
GO
/****** Object:  Table [dbo].[CHTop100]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHTop100](
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](60) NULL,
	[Supplier] [nvarchar](255) NULL,
	[AWP] [money] NULL,
	[Top100Price] [money] NULL,
	[UDSPrice] [money] NULL,
	[PricePerUnit] [money] NULL,
	[BrandName] [varchar](255) NULL,
	[Form] [varchar](60) NULL,
	[Color] [varchar](60) NULL,
	[NDC] [varchar](15) NULL,
	[CIN] [varchar](15) NOT NULL,
	[DP] [varchar](15) NULL,
	[GPI] [varchar](14) NULL,
	[GCN] [varchar](6) NULL,
	[GCN_SEQNO] [varchar](6) NULL,
	[Filedate] [datetime] NOT NULL,
 CONSTRAINT [PK_CHTop100] PRIMARY KEY CLUSTERED 
(
	[CIN] ASC,
	[Filedate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
