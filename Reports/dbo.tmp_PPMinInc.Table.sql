USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PPMinInc]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPMinInc](
	[customer_no] [varchar](31) NULL,
	[ndc] [varchar](15) NULL,
	[aapunitcostmin] [money] NULL
) ON [PRIMARY]
GO
