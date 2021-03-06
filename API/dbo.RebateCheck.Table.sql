USE [API]
GO
/****** Object:  Table [dbo].[RebateCheck]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RebateCheck](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[InvDate] [datetime] NULL,
	[Rebate] [numeric](38, 2) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[IsZero] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RebateCheck] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
