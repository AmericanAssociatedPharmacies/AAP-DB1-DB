USE [WebDev]
GO
/****** Object:  Table [dbo].[userstore]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userstore](
	[loginid] [int] NOT NULL,
	[pmid] [int] NOT NULL,
 CONSTRAINT [PK_userstore] PRIMARY KEY CLUSTERED 
(
	[loginid] ASC,
	[pmid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
