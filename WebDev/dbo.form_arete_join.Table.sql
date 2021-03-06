USE [WebDev]
GO
/****** Object:  Table [dbo].[form_arete_join]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[form_arete_join](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](255) NULL,
	[lastname] [varchar](255) NULL,
	[pharmacyname] [varchar](255) NULL,
	[ncpdp] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[state] [varchar](255) NULL,
	[phoneareacode] [varchar](255) NULL,
	[phone1] [varchar](255) NULL,
	[phone2] [varchar](255) NULL,
	[faxareacode] [varchar](255) NULL,
	[fax1] [varchar](255) NULL,
	[fax2] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[comment] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
