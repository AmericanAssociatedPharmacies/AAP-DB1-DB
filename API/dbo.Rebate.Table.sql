USE [API]
GO
/****** Object:  Table [dbo].[Rebate]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rebate](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[NDC] [varchar](13) NULL,
	[DateKey] [int] NULL,
	[APIRebate] [money] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Rebate] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Rebate] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
