USE [WebDev]
GO
/****** Object:  Table [dbo].[QAttestation]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QAttestation](
	[QID] [int] IDENTITY(1,1) NOT NULL,
	[AttestationYear] [int] NOT NULL,
	[AIsMandatory] [bit] NULL,
	[QText] [nvarchar](max) NOT NULL,
	[QSortOrder] [int] NOT NULL,
	[InputType] [nchar](10) NULL,
	[ADataType] [nvarchar](50) NULL,
	[AWidth] [int] NULL,
 CONSTRAINT [PK_QAttestation] PRIMARY KEY CLUSTERED 
(
	[QID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [CK_QAttestation] UNIQUE NONCLUSTERED 
(
	[AttestationYear] ASC,
	[QSortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
