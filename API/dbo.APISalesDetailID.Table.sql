USE [API]
GO
/****** Object:  Table [dbo].[APISalesDetailID]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetailID](
	[RowID] [int] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[APISalesDetailID] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
