USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_WebLocator]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_WebLocator](
	[PMID] [int] NOT NULL,
	[ALTERNATEZIPS] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PM_WebLocator] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_WebLocator] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_WebLocator] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
