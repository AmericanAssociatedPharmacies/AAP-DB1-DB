USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_AffiliateHistory]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AffiliateHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[GroupID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Reason] [varchar](max) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[StatusCode] [varchar](50) NULL,
 CONSTRAINT [PK_PM_AffiliateHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PM_AffiliateHistory] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_AffiliateHistory] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_AffiliateHistory] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
