USE [WebDev]
GO
/****** Object:  Table [dbo].[ChecklistCatg]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChecklistCatg](
	[CatgID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](200) NULL,
 CONSTRAINT [PK_ChecklistCatg] PRIMARY KEY CLUSTERED 
(
	[CatgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
