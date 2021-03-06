USE [WebDev]
GO
/****** Object:  Table [dbo].[MessageCenter_Messages]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageCenter_Messages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_posted] [datetime] NULL,
	[date_expires] [datetime] NULL,
	[title] [varchar](255) NOT NULL,
	[link] [varchar](255) NOT NULL,
	[description] [varchar](max) NULL,
	[access_codes] [varchar](255) NULL,
	[PMIDs] [varchar](255) NULL,
	[query_text] [varchar](max) NULL,
 CONSTRAINT [PK_MessageCenter_Messages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MessageCenter_Messages] ADD  CONSTRAINT [DF_MessageCenter_Messages_date_posted]  DEFAULT (getdate()) FOR [date_posted]
GO
