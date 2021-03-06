USE [reporting]
GO
/****** Object:  Table [dbo].[Rx30Stores_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx30Stores_del](
	[NABP] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ProfitMinder] [int] NULL,
 CONSTRAINT [PK_Rx30Stores] PRIMARY KEY CLUSTERED 
(
	[NABP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Rx30Stores_del] ADD  CONSTRAINT [DF_Rx30Stores_ProfitMinder]  DEFAULT ((0)) FOR [ProfitMinder]
GO
