USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_Programs]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Programs](
	[ProgramID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
	[CommentConst] [varchar](255) NULL,
	[Category] [char](1) NULL,
	[AAP] [smallint] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[WebProfile] [smallint] NOT NULL,
 CONSTRAINT [PK_PM_Programs_New] PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PM_Programs] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Programs] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Programs] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_Programs] ADD  DEFAULT ((0)) FOR [WebProfile]
GO
