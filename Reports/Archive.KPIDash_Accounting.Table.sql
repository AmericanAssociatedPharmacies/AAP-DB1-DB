USE [Reports]
GO
/****** Object:  Table [Archive].[KPIDash_Accounting]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[KPIDash_Accounting](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[RebateDate] [date] NULL,
	[RebateType] [varchar](100) NULL,
	[RebateAmount] [money] NULL,
	[UserOriginalLogin] [varchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[DeletedBy] [varchar](100) NULL,
	[DeletedOn] [datetime] NULL,
	[IsValid] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Archive].[KPIDash_Accounting] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Archive].[KPIDash_Accounting] ADD  DEFAULT ((1)) FOR [IsValid]
GO
