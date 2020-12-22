USE [reporting]
GO
/****** Object:  Table [dbo].[temp_COG_Compare_genrebate_0909_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_COG_Compare_genrebate_0909_del](
	[Store] [varchar](10) NULL,
	[GenericRebatePerc] [float] NULL,
	[GenericRebateAmt] [money] NULL,
	[Comment] [varchar](10) NULL
) ON [PRIMARY]
GO
