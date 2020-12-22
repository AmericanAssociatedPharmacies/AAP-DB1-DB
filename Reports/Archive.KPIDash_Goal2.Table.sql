USE [Reports]
GO
/****** Object:  Table [Archive].[KPIDash_Goal2]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[KPIDash_Goal2](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Score] [decimal](18, 2) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Archive_KPIDash_Goal2] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Archive].[KPIDash_Goal2] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
