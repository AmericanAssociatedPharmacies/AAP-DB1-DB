USE [Medispan]
GO
/****** Object:  Table [dbo].[DosageItems]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DosageItems](
	[API#] [nvarchar](50) NULL,
	[Item] [nvarchar](50) NULL,
	[Description2] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL
) ON [PRIMARY]
GO
