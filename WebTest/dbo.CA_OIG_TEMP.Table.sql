USE [WebTest]
GO
/****** Object:  Table [dbo].[CA_OIG_TEMP]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_OIG_TEMP](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](64) NULL,
	[FirstName] [nvarchar](64) NULL,
	[MiddleName] [nvarchar](64) NULL,
	[BUSNAME] [nvarchar](64) NULL,
	[GENERAL] [nvarchar](64) NULL,
	[SPECIALTY] [nvarchar](64) NULL,
	[UPIN] [nvarchar](64) NULL,
	[NPI] [nvarchar](64) NULL,
	[DOB] [nvarchar](64) NULL,
	[ADDRESS] [nvarchar](64) NULL,
	[CITY] [nvarchar](64) NULL,
	[STATE] [nvarchar](64) NULL,
	[ZIP] [nvarchar](64) NULL,
	[EXCLTYPE] [nvarchar](64) NULL,
	[EXCLDATE] [nvarchar](64) NULL,
	[REINDATE] [nvarchar](64) NULL,
	[WAIVERDATE] [nvarchar](64) NULL,
	[WVRSTATE] [nvarchar](64) NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_CA_OIG_TEMP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CA_OIG_TEMP] ADD  CONSTRAINT [DF_CA_OIG_TEMP_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[CA_OIG_TEMP] ADD  CONSTRAINT [DF_CA_OIG_TEMP_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
