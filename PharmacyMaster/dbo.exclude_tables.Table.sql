USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[exclude_tables]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exclude_tables](
	[table_name] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[table_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[exclude_tables] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[exclude_tables] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[exclude_tables] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
