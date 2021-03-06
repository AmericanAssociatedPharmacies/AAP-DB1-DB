USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[NCPDP_RelationshipType_Affiliates]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_RelationshipType_Affiliates](
	[RelationshipType] [varchar](2) NOT NULL,
	[TypeName] [varchar](max) NULL,
 CONSTRAINT [PK_NCPDP_RelationshipType_Affiliates] PRIMARY KEY CLUSTERED 
(
	[RelationshipType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
