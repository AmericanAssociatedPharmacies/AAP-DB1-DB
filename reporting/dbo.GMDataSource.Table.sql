USE [reporting]
GO
/****** Object:  Table [dbo].[GMDataSource]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMDataSource](
	[DataID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DataSource] [nvarchar](50) NULL,
 CONSTRAINT [PK_switches] PRIMARY KEY CLUSTERED 
(
	[DataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
