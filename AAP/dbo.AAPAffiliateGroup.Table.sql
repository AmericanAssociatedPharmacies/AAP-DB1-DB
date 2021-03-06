USE [AAP]
GO
/****** Object:  Table [dbo].[AAPAffiliateGroup]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPAffiliateGroup](
	[AffiliateGroupID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AffiliateGroupName] [varchar](50) NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_AAPAffiliateGroup] PRIMARY KEY CLUSTERED 
(
	[AffiliateGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AAPAffiliateGroup]  WITH CHECK ADD  CONSTRAINT [FK_AAPAffiliateGroup_AAPAffiliateGroup] FOREIGN KEY([AffiliateGroupID])
REFERENCES [dbo].[AAPAffiliateGroup] ([AffiliateGroupID])
GO
ALTER TABLE [dbo].[AAPAffiliateGroup] CHECK CONSTRAINT [FK_AAPAffiliateGroup_AAPAffiliateGroup]
GO
