USE [intranet]
GO
/****** Object:  Table [dbo].[login]    Script Date: 12/22/2020 4:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[username] [nvarchar](50) NULL,
	[logintime] [datetime] NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
