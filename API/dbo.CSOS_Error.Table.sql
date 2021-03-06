USE [API]
GO
/****** Object:  Table [dbo].[CSOS_Error]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSOS_Error](
	[ErrorId] [int] IDENTITY(1,1) NOT NULL,
	[XmlFrmLegisym] [xml] NULL,
	[LegisymFileName] [nvarchar](350) NULL,
	[ServiceContract] [nvarchar](45) NULL,
 CONSTRAINT [PK_CSOS_Error] PRIMARY KEY CLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
