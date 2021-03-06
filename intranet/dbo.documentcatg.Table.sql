USE [intranet]
GO
/****** Object:  Table [dbo].[documentcatg]    Script Date: 12/22/2020 4:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[documentcatg](
	[catid] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_documentcatg] PRIMARY KEY CLUSTERED 
(
	[catid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
