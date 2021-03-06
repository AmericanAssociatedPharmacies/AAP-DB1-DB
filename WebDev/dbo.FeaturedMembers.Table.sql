USE [WebDev]
GO
/****** Object:  Table [dbo].[FeaturedMembers]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeaturedMembers](
	[FeaturedMemberID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [text] NULL,
	[MemberImage] [varchar](128) NULL,
	[MemberName] [varchar](128) NOT NULL,
	[StatusID] [int] NOT NULL,
	[PreviewContent] [text] NULL,
	[MemberCity] [varchar](64) NULL,
	[MemberState] [varchar](2) NULL,
	[PublishDate] [date] NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_FeaturedMembers] PRIMARY KEY CLUSTERED 
(
	[FeaturedMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[FeaturedMembers] ADD  DEFAULT ((0)) FOR [IsActive]
GO
