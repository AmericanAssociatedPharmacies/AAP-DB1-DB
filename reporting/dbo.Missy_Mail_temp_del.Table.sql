USE [reporting]
GO
/****** Object:  Table [dbo].[Missy_Mail_temp_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Missy_Mail_temp_del](
	[NANUM] [nvarchar](255) NULL,
	[Smn] [nvarchar](255) NULL,
	[NANAME] [nvarchar](255) NULL,
	[NAADR1] [nvarchar](255) NULL,
	[NAADR2] [nvarchar](255) NULL,
	[NAADR4] [nvarchar](255) NULL,
	[BUSCLS] [nvarchar](255) NULL,
	[CONTACT] [nvarchar](255) NULL,
	[PHONE] [nvarchar](255) NULL,
	[FAX] [nvarchar](255) NULL,
	[EMAIL] [nvarchar](255) NULL,
	[NABP] [nvarchar](255) NULL,
	[DEA#] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL
) ON [PRIMARY]
GO
