USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_DeletedPMID_BeforeUpdate_2262019]    Script Date: 12/22/2020 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_DeletedPMID_BeforeUpdate_2262019](
	[PK_DeletedPMID] [int] IDENTITY(1,1) NOT NULL,
	[Deleted_PMID] [int] NULL,
	[MovedTo_PMID] [int] NULL,
	[Reason] [varchar](255) NULL,
	[DeletedDate] [datetime] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
