USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_Locks]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Locks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[LockTime] [smalldatetime] NOT NULL,
	[sysuser] [varchar](100) NULL,
 CONSTRAINT [PK_PM_Locks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
