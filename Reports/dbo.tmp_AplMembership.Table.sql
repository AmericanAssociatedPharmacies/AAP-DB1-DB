USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_AplMembership]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AplMembership](
	[PreviousGroup] [varchar](128) NULL,
	[MembStatus] [varchar](128) NULL,
	[ApplicationFeePaid] [varchar](128) NULL,
	[OwnerType] [varchar](128) NULL
) ON [PRIMARY]
GO
