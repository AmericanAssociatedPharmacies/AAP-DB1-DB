USE [AAP]
GO
/****** Object:  Table [dbo].[tmp_test]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_test](
	[type1] [varchar](21) NOT NULL,
	[type2] [varchar](3) NOT NULL,
	[source] [varchar](10) NOT NULL,
	[count] [int] NULL
) ON [PRIMARY]
GO
