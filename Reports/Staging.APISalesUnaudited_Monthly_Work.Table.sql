USE [Reports]
GO
/****** Object:  Table [Staging].[APISalesUnaudited_Monthly_Work]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APISalesUnaudited_Monthly_Work](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[PMID] [int] NULL,
	[InvDate] [datetime] NULL,
	[ExtSales] [money] NULL,
	[Type] [varchar](15) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[ItemGroup] [varchar](5) NULL,
 CONSTRAINT [CPK_Staging_APISalesUnaudited_Monthly_Work] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[APISalesUnaudited_Monthly_Work] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
