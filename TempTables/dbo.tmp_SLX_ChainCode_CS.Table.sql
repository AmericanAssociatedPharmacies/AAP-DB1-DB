USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_SLX_ChainCode_CS]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SLX_ChainCode_CS](
	[AAPAccountNo] [varchar](255) NULL,
	[NCPDP] [varchar](255) NULL,
	[ChainCode] [float] NULL,
	[NPI] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Fax] [varchar](255) NULL,
	[DEA] [varchar](255) NULL
) ON [PRIMARY]
GO
