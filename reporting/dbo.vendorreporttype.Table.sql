USE [reporting]
GO
/****** Object:  Table [dbo].[vendorreporttype]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendorreporttype](
	[vendorid] [int] NOT NULL,
	[reporttype] [char](3) NOT NULL
) ON [PRIMARY]
GO
