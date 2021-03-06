USE [Reports]
GO
/****** Object:  Table [dbo].[CompanyGoals_Goal2_new]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyGoals_Goal2_new](
	[Year] [int] NOT NULL,
	[PreferedPartner] [money] NULL,
	[Planograms] [numeric](38, 2) NULL,
	[AAPAreteCredit] [money] NULL,
	[PatronageDividend] [numeric](38, 2) NULL,
	[InstantRebate] [money] NULL,
	[APIMonthlyRebate] [money] NULL,
	[GAC] [money] NULL,
	[BrandRxCredit] [money] NULL,
	[GenericIncentive] [numeric](38, 2) NULL,
	[APIAreteCredit] [money] NULL,
	[CAHMonthlyRebate] [money] NULL,
	[LeaderQtrRebate] [money] NULL,
	[PriceProtectionRebate] [money] NULL,
	[TotalRebate] [numeric](38, 2) NULL,
	[RowcreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Year] PRIMARY KEY CLUSTERED 
(
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyGoals_Goal2_new] ADD  DEFAULT (getdate()) FOR [RowcreatedDate]
GO
