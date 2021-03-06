USE [WebDev]
GO
/****** Object:  Table [dbo].[Rebates2016]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rebates2016](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[AAP] [money] NULL,
	[API] [money] NULL,
	[CAH] [money] NULL,
	[Total] [money] NULL,
	[Year] [int] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Rebates2016] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
