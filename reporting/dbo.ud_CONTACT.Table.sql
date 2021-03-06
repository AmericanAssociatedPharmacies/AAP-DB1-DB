USE [reporting]
GO
/****** Object:  Table [dbo].[ud_CONTACT]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ud_CONTACT](
	[CONTACT_ID] [int] NULL,
	[XREF_ID] [int] NULL,
	[XREF_TYPE] [char](6) NULL,
	[FIRST_NAME] [varchar](20) NULL,
	[LAST_NAME] [varchar](50) NULL,
	[TITLE] [varchar](60) NULL,
	[VOICE_AREA] [char](3) NULL,
	[VOICE_LOCAL] [char](7) NULL,
	[FAX_AREA] [char](3) NULL,
	[FAX_LOCAL] [char](7) NULL,
	[EMAIL] [varchar](64) NULL,
	[COMMENT] [varchar](254) NULL,
	[CITY] [varchar](25) NULL,
	[STATE] [char](2) NULL,
	[ZIP] [varchar](10) NULL,
	[CONTACT_TYPE] [varchar](15) NULL,
	[ADDRESS1] [varchar](40) NULL,
	[ADDRESS2] [varchar](40) NULL
) ON [PRIMARY]
GO
