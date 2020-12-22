USE [Reports]
GO
/****** Object:  Table [dbo].[KPIDash_Goal3_testingtable_all]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KPIDash_Goal3_testingtable_all](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[RebateType] [varchar](150) NULL,
	[Audited] [varchar](1) NOT NULL,
	[Amount] [money] NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
