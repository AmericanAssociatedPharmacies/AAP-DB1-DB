USE [Reports]
GO
/****** Object:  Table [dbo].[Load_Log]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Load_Log](
	[loadid] [int] IDENTITY(1,1) NOT NULL,
	[load_type_id] [int] NOT NULL,
	[data_date] [datetime] NOT NULL,
	[load_date] [datetime] NOT NULL,
	[filename] [varchar](255) NULL,
	[type] [varchar](50) NULL,
 CONSTRAINT [PK_Load_Log] PRIMARY KEY CLUSTERED 
(
	[loadid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
