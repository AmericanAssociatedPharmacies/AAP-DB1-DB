USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_PDiv1209_Sales]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PDiv1209_Sales](
	[PMID] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[AAPParent] [varchar](20) NULL,
	[API#] [nvarchar](255) NULL,
	[UD#] [nvarchar](255) NULL,
	[territory] [varchar](4) NULL,
	[Store Name] [varchar](65) NULL,
	[Contact] [varchar](255) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Corporate Name] [varchar](100) NULL,
	[Remit Address] [varchar](100) NULL,
	[Remit Address2] [varchar](100) NULL,
	[Remit City] [varchar](50) NULL,
	[Remit State] [varchar](2) NULL,
	[Remit Zip] [varchar](50) NULL,
	[Dividend] [float] NULL
) ON [PRIMARY]
GO
