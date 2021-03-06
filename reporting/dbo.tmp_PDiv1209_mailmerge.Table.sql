USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_PDiv1209_mailmerge]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PDiv1209_mailmerge](
	[Vendor ID] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[Contact] [varchar](255) NULL,
	[StoreName] [varchar](65) NULL,
	[TaxName] [varchar](100) NULL,
	[Address1] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Patr Div] [float] NULL
) ON [PRIMARY]
GO
