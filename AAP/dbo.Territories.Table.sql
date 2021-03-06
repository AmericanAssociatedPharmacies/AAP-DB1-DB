USE [AAP]
GO
/****** Object:  Table [dbo].[Territories]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Territories](
	[Territory] [varchar](2) NOT NULL,
	[LastName] [varchar](35) NULL,
	[FirstName] [varchar](35) NULL,
	[GeogArea] [varchar](50) NULL,
	[Telephone] [varchar](25) NULL,
	[TS] [timestamp] NULL,
	[Cell] [varchar](25) NULL,
	[Fax] [varchar](25) NULL,
 CONSTRAINT [PK_Territories] PRIMARY KEY CLUSTERED 
(
	[Territory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
