USE [intranet]
GO
/****** Object:  Table [dbo].[deptuser]    Script Date: 12/22/2020 4:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deptuser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[deptid] [int] NOT NULL,
	[username] [nvarchar](50) NULL,
 CONSTRAINT [PK_deptuser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
