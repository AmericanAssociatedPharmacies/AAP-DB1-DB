USE [Pricing]
GO
/****** Object:  Table [dbo].[IC_Status]    Script Date: 12/22/2020 4:51:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IC_Status](
	[StatusID] [int] NOT NULL,
	[StatusName] [nchar](16) NOT NULL,
 CONSTRAINT [PK_IC_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
