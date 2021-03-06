USE [API]
GO
/****** Object:  Table [dbo].[APISalesDetail_Report]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail_Report](
	[ID] [int] NOT NULL,
	[InvDate] [datetime] NOT NULL,
	[WHAccountID] [varchar](8) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_APISalesDetail_Report] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[InvDate] ASC,
	[WHAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[APISalesDetail_Report] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
