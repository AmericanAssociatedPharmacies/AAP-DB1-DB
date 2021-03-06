USE [AAP]
GO
/****** Object:  Table [dbo].[AAPStoreModifications]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPStoreModifications](
	[AccountID] [int] NOT NULL,
	[ModDate] [datetime] NOT NULL,
	[ModType] [varchar](10) NULL,
	[WhyModified] [varchar](100) NULL,
	[TS] [timestamp] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_AAPStoreModifications] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[ModDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AAPStoreModifications] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[AAPStoreModifications] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[AAPStoreModifications] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
