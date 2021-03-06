USE [WebDev]
GO
/****** Object:  Table [dbo].[DCGroupsWeb]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DCGroupsWeb](
	[Grp#] [varchar](5) NULL,
	[Disp Fee] [numeric](3, 2) NULL,
	[Reimbursement Indictor] [varchar](3) NOT NULL,
	[Brand] [varchar](9) NULL,
	[Non-MAC Generic] [varchar](10) NULL,
	[MAC] [varchar](65) NULL
) ON [PRIMARY]
GO
