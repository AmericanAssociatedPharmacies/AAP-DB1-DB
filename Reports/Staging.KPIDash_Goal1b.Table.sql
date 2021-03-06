USE [Reports]
GO
/****** Object:  Table [Staging].[KPIDash_Goal1b]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[KPIDash_Goal1b](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Type] [varchar](15) NULL,
	[Amount] [int] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_KPIDash_Goal1b] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[KPIDash_Goal1b] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
