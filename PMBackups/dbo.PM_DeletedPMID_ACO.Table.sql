USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_DeletedPMID_ACO]    Script Date: 12/22/2020 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_DeletedPMID_ACO](
	[PK_DeletedPMID] [int] IDENTITY(1,1) NOT NULL,
	[Deleted_PMID] [int] NULL,
	[MovedTo_PMID] [int] NULL,
	[Reason] [varchar](255) NULL,
	[DeletedDate] [datetime] NULL
) ON [PRIMARY]
GO
