USE [reporting]
GO
/****** Object:  Table [dbo].[Load_Description]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Load_Description](
	[load_type_id] [int] NOT NULL,
	[load_description] [nvarchar](50) NULL,
	[load_frequency] [nvarchar](50) NULL,
 CONSTRAINT [PK_Load_Description] PRIMARY KEY CLUSTERED 
(
	[load_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
