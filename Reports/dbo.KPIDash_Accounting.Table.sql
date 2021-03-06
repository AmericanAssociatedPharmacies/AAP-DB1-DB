USE [Reports]
GO
/****** Object:  Table [dbo].[KPIDash_Accounting]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KPIDash_Accounting](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[RebateDate] [date] NULL,
	[RebateType] [varchar](100) NULL,
	[RebateAmount] [money] NULL,
	[UserOriginalLogin] [varchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[DeletedBy] [varchar](100) NULL,
	[DeletedOn] [datetime] NULL,
	[IsValid] [bit] NULL,
 CONSTRAINT [CPK_DBO_KPIDash_Accounting] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KPIDash_Accounting] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[KPIDash_Accounting] ADD  DEFAULT ((1)) FOR [IsValid]
GO
