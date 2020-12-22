USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_epic_bkp]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_epic_bkp](
	[Account] [varchar](255) NULL,
	[Addr1] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Zip] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[GroupAlliance] [varchar](255) NULL
) ON [PRIMARY]
GO
