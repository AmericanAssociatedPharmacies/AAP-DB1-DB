USE [ODSIntake]
GO
/****** Object:  Table [dbo].[APIInventory]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIInventory](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[CompanyNo] [varchar](10) NULL,
	[ItemNum] [varchar](25) NULL,
	[Warehouse] [varchar](25) NULL,
	[QOH] [decimal](18, 2) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_APIInventory] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[APIInventory] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
