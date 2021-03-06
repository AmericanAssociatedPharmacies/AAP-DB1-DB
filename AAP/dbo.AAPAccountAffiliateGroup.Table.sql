USE [AAP]
GO
/****** Object:  Table [dbo].[AAPAccountAffiliateGroup]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPAccountAffiliateGroup](
	[AffiliateGroupID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
 CONSTRAINT [PK_AAPAccountAffiliateGroup] PRIMARY KEY CLUSTERED 
(
	[AffiliateGroupID] ASC,
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AAPAccountAffiliateGroup]  WITH CHECK ADD  CONSTRAINT [FK_AAPAccountAffiliateGroup_AAPAccountAffiliateGroup] FOREIGN KEY([AffiliateGroupID], [AccountID])
REFERENCES [dbo].[AAPAccountAffiliateGroup] ([AffiliateGroupID], [AccountID])
GO
ALTER TABLE [dbo].[AAPAccountAffiliateGroup] CHECK CONSTRAINT [FK_AAPAccountAffiliateGroup_AAPAccountAffiliateGroup]
GO
