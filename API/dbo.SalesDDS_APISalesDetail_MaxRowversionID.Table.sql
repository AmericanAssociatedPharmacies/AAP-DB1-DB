USE [API]
GO
/****** Object:  Table [dbo].[SalesDDS_APISalesDetail_MaxRowversionID]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesDDS_APISalesDetail_MaxRowversionID](
	[RowversionID] [varchar](50) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SalesDDS_APISalesDetail_MaxRowversionID] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
