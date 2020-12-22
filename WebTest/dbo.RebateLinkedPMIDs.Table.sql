USE [WebTest]
GO
/****** Object:  Table [dbo].[RebateLinkedPMIDs]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RebateLinkedPMIDs](
	[PMID] [int] NOT NULL,
	[LinkedPMIDs] [varchar](255) NULL,
 CONSTRAINT [PK_RebateLinkedPMIDs] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
