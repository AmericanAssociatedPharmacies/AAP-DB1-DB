USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[WarehouseProgram]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseProgram](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[APIAccountNmbr] [varchar](20) NULL,
	[EffectiveDate] [date] NULL,
	[QuitDate] [date] NULL,
	[ProgramName] [varchar](25) NULL,
	[StatusCode] [varchar](25) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WarehouseProgram] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
