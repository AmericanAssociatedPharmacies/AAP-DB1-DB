USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_DeletedPMID_BU]    Script Date: 12/22/2020 4:47:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_DeletedPMID_BU](
	[PK_DeletedPMID] [int] IDENTITY(1,1) NOT NULL,
	[Deleted_PMID] [int] NULL,
	[MovedTo_PMID] [int] NULL,
	[Reason] [varchar](255) NULL,
	[DeletedDate] [datetime] NULL
) ON [PRIMARY]
GO
