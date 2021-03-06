USE [Reports]
GO
/****** Object:  Table [dbo].[dbo.KPIDash_Accounting_old]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbo.KPIDash_Accounting_old](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[RebateDate] [date] NULL,
	[GenericLoyaltyAmount] [money] NULL,
	[PatronageDividendAmount] [money] NULL,
	[UserOriginalLogin] [varchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_KPIDash_Accounting] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dbo.KPIDash_Accounting_old] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
