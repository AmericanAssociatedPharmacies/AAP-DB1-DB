USE [Reports]
GO
/****** Object:  Table [dbo].[ConfereceCredits]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfereceCredits](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Jan] [money] NOT NULL,
	[Feb] [money] NOT NULL,
	[March] [money] NOT NULL,
	[April] [money] NOT NULL,
	[May] [money] NOT NULL,
	[June] [money] NOT NULL,
	[July] [money] NOT NULL,
	[August] [money] NOT NULL,
	[September] [money] NOT NULL,
	[October] [money] NOT NULL,
	[November] [money] NOT NULL,
	[December] [money] NOT NULL,
	[RowCreatdDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[Annual] [money] NOT NULL,
 CONSTRAINT [CPK_ConferenceCredits] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ConfereceCredits] ADD  DEFAULT ((0.00)) FOR [Jan]
GO
ALTER TABLE [dbo].[ConfereceCredits] ADD  DEFAULT ((0.00)) FOR [Feb]
GO
ALTER TABLE [dbo].[ConfereceCredits] ADD  DEFAULT ((0.00)) FOR [March]
GO
ALTER TABLE [dbo].[ConfereceCredits] ADD  DEFAULT ((0.00)) FOR [April]
GO
ALTER TABLE [dbo].[ConfereceCredits] ADD  DEFAULT ((0.00)) FOR [May]
GO
ALTER TABLE [dbo].[ConfereceCredits] ADD  DEFAULT ((0.00)) FOR [June]
GO
ALTER TABLE [dbo].[ConfereceCredits] ADD  DEFAULT ((0.00)) FOR [July]
GO
ALTER TABLE [dbo].[ConfereceCredits] ADD  DEFAULT ((0.00)) FOR [August]
GO
ALTER TABLE [dbo].[ConfereceCredits] ADD  DEFAULT ((0.00)) FOR [September]
GO
ALTER TABLE [dbo].[ConfereceCredits] ADD  DEFAULT ((0.00)) FOR [October]
GO
ALTER TABLE [dbo].[ConfereceCredits] ADD  DEFAULT ((0.00)) FOR [November]
GO
ALTER TABLE [dbo].[ConfereceCredits] ADD  DEFAULT ((0.00)) FOR [December]
GO
ALTER TABLE [dbo].[ConfereceCredits] ADD  DEFAULT (getdate()) FOR [RowCreatdDate]
GO
ALTER TABLE [dbo].[ConfereceCredits] ADD  DEFAULT ((0.00)) FOR [Annual]
GO
