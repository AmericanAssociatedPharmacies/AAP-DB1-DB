USE [TempTables]
GO
/****** Object:  Table [dbo].[NCPAIneligible]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPAIneligible](
	[PMID] [float] NULL,
	[AAPAccountno] [float] NULL,
	[AAPParentNo] [float] NULL,
	[Text Field] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](255) NULL,
	[Accountname] [nvarchar](255) NULL,
	[Addr1] [nvarchar](255) NULL,
	[Addr2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[contactfullname] [nvarchar](255) NULL
) ON [PRIMARY]
GO
