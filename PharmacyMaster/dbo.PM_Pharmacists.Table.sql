USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_Pharmacists]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Pharmacists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[PharPrime] [smallint] NULL,
	[PharFullName] [varchar](255) NULL,
	[PharTitle] [varchar](20) NULL,
	[PharState] [varchar](2) NULL,
	[PharLicNo] [varchar](20) NULL,
	[PharExpDate] [datetime] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_Pharmacists] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PM_Pharmacists] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Pharmacists] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Pharmacists] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
