USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_wsvolume_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_wsvolume_del](
	[ACCT_NO] [varchar](4) NULL,
	[type] [varchar](15) NULL,
	[EFFECTIVE] [datetime] NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[Month1] [numeric](14, 2) NULL,
	[Month2] [numeric](14, 2) NULL,
	[MChange] [numeric](14, 2) NULL,
	[Q1] [numeric](14, 2) NULL,
	[Q2] [numeric](14, 2) NULL,
	[QChange] [numeric](14, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tmp_wsvolume_del] ADD  CONSTRAINT [DF_tmp_wsvolume_Month1]  DEFAULT ((0.00)) FOR [Month1]
GO
ALTER TABLE [dbo].[tmp_wsvolume_del] ADD  CONSTRAINT [DF_tmp_wsvolume_Month2]  DEFAULT ((0.00)) FOR [Month2]
GO
ALTER TABLE [dbo].[tmp_wsvolume_del] ADD  CONSTRAINT [DF_tmp_wsvolume_MChange]  DEFAULT ((0.00)) FOR [MChange]
GO
ALTER TABLE [dbo].[tmp_wsvolume_del] ADD  CONSTRAINT [DF_tmp_wsvolume_Q1]  DEFAULT ((0.00)) FOR [Q1]
GO
ALTER TABLE [dbo].[tmp_wsvolume_del] ADD  CONSTRAINT [DF_tmp_wsvolume_Q2]  DEFAULT ((0.00)) FOR [Q2]
GO
ALTER TABLE [dbo].[tmp_wsvolume_del] ADD  CONSTRAINT [DF_tmp_wsvolume_QChange]  DEFAULT ((0.00)) FOR [QChange]
GO
