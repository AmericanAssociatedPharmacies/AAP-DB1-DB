USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_PickListSLXNEW]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PickListSLXNEW](
	[ID] [int] NOT NULL,
	[TEXT] [varchar](64) NULL,
	[SHORTTEXT] [varchar](64) NULL,
	[ITEMID] [char](12) NULL,
	[PICKLISTID] [char](12) NULL,
	[USERID] [char](12) NULL,
	[DEFAULTINDEX] [int] NULL,
	[MODIFYDATE] [datetime] NULL,
	[MODIFYUSER] [char](12) NULL,
	[CREATEDATE] [datetime] NULL,
	[CREATEUSER] [char](12) NULL
) ON [PRIMARY]
GO
