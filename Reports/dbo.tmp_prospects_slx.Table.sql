USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_prospects_slx]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_prospects_slx](
	[AccountName] [varchar](255) NULL,
	[Addr1] [varchar](255) NULL,
	[Addr2] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Zip] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Fax] [varchar](255) NULL,
	[County] [varchar](255) NULL
) ON [PRIMARY]
GO
